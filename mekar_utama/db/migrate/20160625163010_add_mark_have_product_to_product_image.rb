class AddMarkHaveProductToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :have_product, :boolean
  end
end
