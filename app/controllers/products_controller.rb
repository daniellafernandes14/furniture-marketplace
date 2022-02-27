class ProductsController < ApplicationController
  def index
    # @products = Product.all

    # if params[:search_query].nil?
    #   session[:search] = params.dig(:search, :query)
    #   # .dig is the value of the nested elements in the parantheses.
    #   # so in this case will be the value of the query
    #   if params[:search_query] == "" || params[:search_query].nil?
    #     @products = Product.all
    #   else
    #     @products = Product.where("name ILIKE ? or colour ILIKE ? or category ILIKE ? or material ILIKE ?",
    #                         "%#{session[:search]}%", "%#{session[:search]}%", "%#{session[:search]}%", "%#{session[:search]}%")
    #   end
    # else
      @products = Product.where("name ILIKE ? or colour ILIKE ? or category ILIKE ? or material ILIKE ?",
                            "%#{params[:search_query]}%", "%#{params[:search_query]}%", "%#{params[:search_query]}%", "%#{params[:search_query]}%")
    # end

    filters = params.dig(:filters, :category)
    if filters.present? && filters.reject(&:empty?).present?
      @products = @products.where(category: filters)
    end

    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude
      }
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
