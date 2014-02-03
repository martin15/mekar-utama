class Product < ActiveRecord::Base
  has_permalink :name, :update => true
  # attr_accessible :title, :body
end
