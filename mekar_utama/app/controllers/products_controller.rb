class ProductsController < ApplicationController
  before_filter :find_category, :only => [:index, :show]

  def index

    @products = @category.products.paginate(:page => params[:page], :per_page => 6,
                                 :order => "created_at DESC" )
  end

  def show
    @product = @category.products.find_by_id(params[:id])
    if @product.nil?
      flash[:error] = "Cannot find the product"
      redirect_to root_path
      return
    end
    @product_images = @product.product_images
  end

  private
    def find_category
      @category = Category.includes(:products).find_by_name(params[:name])
      if @category.nil?
        flash[:error] = "Cannot find the category"
        redirect_to root_path
      end
    end
end
