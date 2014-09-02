class ProductImage < ActiveRecord::Base
  attr_accessor :set_primary_image
  attr_accessible :product_image, :product_id, :is_primary, :is_best_seller, :note
  belongs_to :product

  has_attached_file :product_image, :styles => { :thumb => "125x125",
                                                 :medium => "300x300",
                                                 :large => "600x600" }
  validates_attachment_presence :product_image
  after_destroy :set_primary_image
  scope :primary, :conditions => "is_primary = 1"

  def is_primary?
    !!is_primary
  end

  def change_primary_image
    product = self.product
    old_primary_image = product.primary_image
    unless old_primary_image.nil?
      return false unless old_primary_image.unset_primary
    end
    self.set_primary
    return self.save
  end

  def set_primary_image
    product = self.product
    return unless product.primary_image.nil?
    new_pimary_image = product.product_images.first
    unless new_pimary_image.nil?
      new_pimary_image.update_attribute :is_primary, true
    end
  end

  def unset_primary
    self.is_primary = false
    self.save!
  end

  protected
    def set_primary
      self.is_primary = true
    end
end
