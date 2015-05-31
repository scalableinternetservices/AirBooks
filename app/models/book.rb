class Book < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '200x300>', thumb: '100x150>', large: '400x600>' }, default_url: ':style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :book_review

  searchable do
    text :title, :default_boost => 2
    text :author, :default_boost => 2

    integer :isbn
    string :owner_email
    string :image_file_name

    time    :due_date
    time    :updated_at

    string  :sort_title do
      title.downcase.gsub(/^(an?|the)/, '')
    end
  end
end
