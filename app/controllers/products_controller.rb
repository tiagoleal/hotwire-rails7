class ProductsController < ApplicationController
  before_action :set_products, only: %i[show edit update destroy]
  before_action :new_product, only: %i[index create]

  def index
    @products = Product.all.order(id: :desc)
  end

  def edit; end

  def create
    attributes_params
    respond_to do |format|
      if save_product
        redirect_product(format)
      else
        format_turbo(format)
        product_errors(format)
      end
    end
  end

  def update
    attributes_params
    respond_to do |format|
      if save_product
        redirect_product(format)
      else
        format_turbo(format)
        product_errors(format)
      end
    end
  end

  def show; end

  def destroy
    @product.destroy
    respond_to do |format|
      redirect_product(format)
      format.json { head :no_content }
    end
  end

  private

  def save_product
    @product.save
  end

  def new_product
    @product = Product.new
  end

  def alert_errors
    redirect_to products_path	, alert: @product.errors.full_messages.to_sentence
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def redirect_product(format)
    format.html do
      redirect_to products_path
    end
    format.json { render :show, status: :ok, location: @product }
  end

  def format_turbo(format)
    format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        @product, partial: 'products/form', locals: { product: @product }
      )
    end
    format.html { render :new, status: :unprocessable_entity }
  end

  def product_errors(format)
    format.html { render :edit, status: :unprocessable_entity }
    format.json { render json: @product.errors, status: :unprocessable_entity }
  end

  def attributes_params
    @product.attributes = products_params
  end

  def products_params
    params.require(:product).permit(:code, :description,
      :price, :category_id, :status)
  end
end
