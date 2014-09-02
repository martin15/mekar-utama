class AddNoteProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :note, :string
  end
end
