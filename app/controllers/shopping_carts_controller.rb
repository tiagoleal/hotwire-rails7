class ShoppingCartsController < ApplicationController
  before_action :set_orders, only: %i[show edit update]
  before_action :set_order_products, only: %i[destroy]


  def index
    @orders = Order.find_by(status: 'waiting')
    @orders.total = @orders.order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum  
  end


  def create
    @order = Order.new(orders_params)
    respond_to do |format|
      if @order.save
        format.html do
          redirect_to shopping_carts_path
        end
        format.json { render :show, status: :created, location: @order }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @order, partial: 'order/form', locals: { order: @order }
          )
        end
        
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
        
    if params[:search_term].present?
      @product = Product.find_by(code: params[:search_term])

      if @product.present?
        order_already_exist = Order.find_by(status: 'waiting')
        order_obj = order_already_exist
        unless order_already_exist
          @order = Order.create(
            status: 'waiting',
            user_id: current_user.id,
          )

          OrderProduct.create(
            order_id: @order.id,
            product_id: @product.id,
            unit_price: @product.price,
            quantity: 1
          )  
          order_obj = @order
        end
        
        product_already_exist = OrderProduct.find_by(order_id: order_obj.id, product_id: @product.id)
        unless product_already_exist
          OrderProduct.create(
            order_id: order_obj.id,
            product_id: @product.id,
            unit_price: @product.price,
            quantity: 1
          )  
        end
      end
    end

    @orders = Order.find_by(status: 'waiting')
    @orders.total = @orders.order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum  
    
    respond_to do |format|
      format.html do
        redirect_to shopping_carts_path
      end
      format.json { render :show, status: :created, location: @orders }
    end
  end

  def show
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
    @orderProducts = OrderProduct.find_by(order_id: params[:shopping_cart_id], product_id: params[:product_id])
  end

  def set_orders
    @order = Order.find(params[:id])
  end

  def orders_params
    params.require(:order).permit(:status, :user_id,
      order_products_attributes: %i[quantity product_id order_id])
  end

end
