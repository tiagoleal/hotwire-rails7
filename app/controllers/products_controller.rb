class ProductsController < ApplicationController
  before_action :set_products, only: %i[edit update destroy]

  def index
    @products = Product.order(id: :asc)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new
    @product.attributes = products_params
    if save_product!
      redirect_to products_path	, notice: "#{@product.name} cadastrada com sucesso!"
    else
      alert_errors
    end
  end

  def update
    @product.attributes = products_params
    if save_product!
      redirect_to products_path	, notice: "#{@product.name} atualizada com sucesso!"
    else
      alert_errors
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path	, notice: "#{@product.name} excluída com sucesso!"
    else
      alert_errors
    end
  end

  private

  def save_product!
    @product.save!
  end

  def alert_errors
    redirect_to products_path	, alert: @product.errors.full_messages.to_sentence
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:description,
      :price, :category_id, :status)
  end
end
