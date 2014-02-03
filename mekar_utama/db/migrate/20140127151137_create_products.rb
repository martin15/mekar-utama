class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.text    :description
      t.float   :price
      t.string  :code
      t.string :permalink
      t.timestamps
    end
  end
end
