class Book < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '200x300>', thumb: '100x150>', large: '400x600>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
