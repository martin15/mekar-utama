class Admin::ProductsController < Admin::ApplicationController
  before_filter :find_product, :only => [:show, :destroy, :edit, :update]

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 5,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 5
  end

  def new
    @product = Product.new
    @product.product_images.build
    @category_list = Category.category_list
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Product successfully created"
      redirect_to admin_products_path
    else
      @category_list = Category.category_list
      flash[:error] = "Product failed to create"
      render :action => "new"
    end
  end

  def show
    @product_image = ProductImage.new
    @product_images = @product.product_images
  end

  def edit
    @category_list = Category.category_list
  end

  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product successfully updated"
      redirect_to admin_products_path
    else
      @category_list = Category.category_list
      flash[:error] = "Product failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @product.destroy ? 'Product was successfully deleted.' :
                                      'Product was falied to delete.'
    redirect_to admin_products_path
  end

  private
    def find_product
      @product = Product.find_by_id(params[:id])
      if @product.nil?
        flash[:error] = "Cannot find the Product with id '#{params[:id]}'"
        redirect_to admin_products_path
      end
    end
end
