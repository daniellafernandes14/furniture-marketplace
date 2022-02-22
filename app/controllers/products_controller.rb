class ProductsController < ApplicationController
  def index
    @products = Product.all

    filters = params.dig(:filters, :category)
    if filters.present? && filters.reject(&:empty?).present?
      @products = @products.where(category: filters)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :category, :colour, :material, photos: [])
  end
end
