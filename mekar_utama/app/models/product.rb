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

  def primary_image(size)
    img = product_images.primary.first
    if img.nil?
      set_primary_image
      img = product_images.primary.first
      return "undefined" if img.nil?
    end
    img.product_image.url(size.to_key)
  end

end
