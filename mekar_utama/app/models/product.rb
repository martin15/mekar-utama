class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :code, :permalink, :category_id, :product_images_attributes
  has_permalink :name, :update => true
  belongs_to :category
  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :allow_destroy => true

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
#  validates :price, :presence => true,
#                    :length => {:minimum => 1, :maximum => 254},
#                    :numericality => true

  def primary_image
    product_images.primary.first
  end

end
