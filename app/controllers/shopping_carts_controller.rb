class ShoppingCartsController < ApplicationController
  before_action :set_orders, only: %i[show update]
  before_action :set_order_products, only: %i[destroy]
  before_action :find_by_product, only: %i[search]

  def index
    order_list
  end

  def search

    if params[:search_term].present?
      if @product.present?
        save_order unless order_list
        save_order_product unless order_product_exist?
      end
    end
    respond_to do |format|
      redirect_order(format)
    end
  end

  def show; end

  def update
    respond_to do |format|
      if @order.update(status: 'confirm')
        redirect_order(format)
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @order_products.destroy
    respond_to do |format|
      format.html { redirect_to shopping_carts_path }
      format.json { head :no_content }
    end
  end

  private

  def set_order_products
    @order_products = OrderProduct.find_by(
      order_id: params[:shopping_cart_id],
      product_id: params[:product_id]
    )
  end

  def set_orders
    @order = Order.find(params[:id])
  end

  def find_by_product
    @product = Product.find_by(code: params[:search_term])
  end

  def save_order_product
    OrderProduct.create(
      order_id: @orders.id,
      product_id: @product.id,
      quantity: 1
    )
  end

  def save_order
    @orders = Order.new(
      status: :waiting,
      user_id: current_user.id
    )
    @orders.save
  end

  def order_list
    @orders ||= Order.find_by(user_id: current_user.id, status: 'waiting')
    @orders.total = @orders.order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum unless @orders.nil? 
  end

  def order_product_exist?
    order_product = OrderProduct.find_by(order_id: @orders.id, product_id: @product.id)
    order_product.update(quantity: order_product.quantity + 1) unless order_product.nil?
  end

  def redirect_order(format)
    format.html do
      redirect_to shopping_carts_path
    end
    format.json { render :show, status: :ok, location: @orders }
  end
  
end
