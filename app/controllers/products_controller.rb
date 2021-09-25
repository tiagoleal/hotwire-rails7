class ProductsController < ApplicationController
  before_action :set_products, only: %i[edit update destroy]

  def index
    @products = Product.all.order(id: :desc)
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(products_params)

    respond_to do |format|
      if @product.save
        format.html do
          redirect_to products_path
        end
        format.json { render :show, status: :created, location: @product }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @product, partial: 'products/form', locals: { product: @product }
          )
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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

  def show; end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
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
