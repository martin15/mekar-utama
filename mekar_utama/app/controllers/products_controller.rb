class ProductsController < ApplicationController

  def index
    @category = Category.includes(:products).find_by_name(params[:name])
    if @category.nil?
      flash[:error] = "Cannot find the category"
      redirect_to root_path
    end
    @products = @category.products.paginate(:page => params[:page], :per_page => 6,
                                 :order => "created_at DESC" )
  end

  def show
    @product = Product.find_by_id(params[:id])
    if @product.nil?
      flash[:error] = "Cannot find the product"
      redirect_to root_path
    end
    @product_images = @product.product_images
  end
end
