class ShoppingCartsController < ApplicationController
  before_action :set_orders, only: %i[show edit update]
  before_action :set_order_products, only: %i[destroy]
  before_action :find_by_product, only: %i[search]

  def index
    order_status
    total
  end

  def search
    if params[:search_term].present?
      if @product.present?
        order_obj = order_status
        unless order_obj
          save_order
          save_order_product(order_obj)
          order_obj = @order
        end

        unless product_already_exist(order_obj)
          save_order_product(order_obj)
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

  def destroy
    @orderProducts.destroy
    respond_to do |format|
      format.html { redirect_to shopping_carts_path }
      format.json { head :no_content }
    end
  end

  private

  def set_order_products
    @orderProducts = OrderProduct.find_by(order_id: params[:shopping_cart_id],
    product_id: params[:product_id])
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

  def save_order_product(order_obj)
    OrderProduct.create(
      order_id: order_obj.id,
      product_id: @product.id,
      unit_price: @product.price,
      quantity: 1
    )
  end

  def save_order
    @order = Order.create(
      status: 'waiting',
      user_id: current_user.id,
    )
  end

  def total
    order_status
    @orders.total = @orders.order_products.collect { |order_prod| order_prod.valid? ? order_prod.unit_price * order_prod.quantity : 0}.sum
  end

  def order_status
    @orders = Order.find_by(status: 'waiting')
  end

  def product_already_exist(order_obj)
    OrderProduct.find_by(order_id: order_obj.id, product_id: @product.id)
  end

  def orders_params
    params.require(:order).permit(:status, :user_id,
      order_products_attributes: %i[quantity product_id order_id])
  end

end
