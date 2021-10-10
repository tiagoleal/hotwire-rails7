class ShoppingCartsController < ApplicationController
  before_action :set_orders, only: %i[show update]
  before_action :set_order_products, only: %i[destroy]
  before_action :find_by_product, only: %i[search]

  def index
    order_status
    total
  end

  def search
    if params[:search_term].present?
      if @product.present?
        # order_obj = order_status

        binding.pry
        # order_status



        unless order_status
          save_order
          # save_order_product(order)
          # order_obj = order
        end

        unless product_already_exist?
          save_order_product
        end
      end
    end

    total
    respond_to do |format|
      format.html do
        redirect_to shopping_carts_path
      end
      format.json { render :show, status: :created, location: @orders }
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @order.update(status: 'confirm')
        format.html do
          redirect_to shopping_carts_path
        end
        format.json { render :show, status: :created, location: @order }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end  
  end

 
  def destroy
    @orderProducts.destroy
    respond_to do |format|
      format.html { redirect_to shopping_carts_path }
      format.json { head :no_content }
    end
  end

  private

  def set_order_products
    @orderProducts = OrderProduct.find_by(
      order_id: params[:shopping_cart_id],
      product_id: params[:product_id]
    )
  end

  def set_orders
    @order = Order.find(params[:id])
  end

  def attributes_params
    @order.attributes = products_params
  end

  def find_by_product
    @product = Product.find_by(code: params[:search_term])
  end

  def save_order_product
    OrderProduct.create(
      order_id: @orders.id,
      product_id: @product.id,
      unit_price: @product.price,
      quantity: 1
    )
  end

  def save_order
    # @orders = Order.create_order

    @orders = Order.new(
      status: :waiting,
      user_id: current_user.id
    )
    @orders.save
    # @orders = Order.find_by(status: 'waiting')

    # @order = Order.new(
    #   status: 'waiting',
    #   user_id: current_user.id
    # )
    # @order.save
    # @orders = Order.find_by(status: 'waiting')
  end

  def total
    order_status
    @orders.total = @orders.order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum unless @orders.nil? 
  end

  def order_status
    @orders ||= Order.find_by(status: 'waiting')
  end

  def product_already_exist?
    OrderProduct.find_by(order_id: @orders.id, product_id: @product.id)
  end

  def orders_params
    params.require(:order).permit(:status, :user_id,
      order_products_attributes: %i[quantity product_id order_id])
  end

end
