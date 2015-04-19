class Listing < ActiveRecord::Base
  has_attached_file :image,  :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "no_thumb.jpg"
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates_attachment_presence :image
end
