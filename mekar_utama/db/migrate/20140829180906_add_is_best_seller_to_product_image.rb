class AddIsBestSellerToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :is_best_seller, :boolean
  end
end
