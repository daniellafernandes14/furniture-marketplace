class PagesController < ApplicationController
  def home
    # if params[:search_query].present?
    #   @products = Product.where("name ILIKE ? or colour ILIKE ? or category ILIKE ? or material ILIKE ?",
    #                             "%#{params[:search_query]}%", "%#{params[:search_query]}%", "%#{params[:search_query]}%", "%#{params[:search_query]}%")
    #   redirect_to products_path(@products)
    # end
  end
end
