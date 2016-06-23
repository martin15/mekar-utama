class ProductsController < ApplicationController
  before_filter :find_category, :only => [:index]
  before_filter :find_product, :only => [:show]

  def index
    @child_categories =  @category.child_categories
    puts @child_categories.inspect
    puts @child_categories.select(:name).inspect
    @products = Product.joins("left join categories_products as cp on cp.product_id = products.id").
      where("cp.category_id in (?)", @child_categories.map(&:id)).uniq
#    @child_categories.each do |cat|
#      @products << cat.products
#    end
    @products = @products.paginate(:page => params[:page], :per_page => 21,
                                 :order => "created_at DESC" )
  end

  def show
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

    def find_product
      @product = Product.find_by_permalink(params[:permalink])
      if @product.nil?
        flash[:error] = "Cannot find the Product"
        redirect_to root_path
      end
    end
end
