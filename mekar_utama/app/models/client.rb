class Client < ActiveRecord::Base
  attr_accessible :client_image, :name, :best_client
  has_attached_file :client_image, :styles => { :thumb => "100x100",
                                                 :medium => "200x200" }
  validates_attachment_presence :client_image
  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
end
