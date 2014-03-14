class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :products

  def self.category_list
    all.map{|category| [category.name, category.id]}
  end
end
