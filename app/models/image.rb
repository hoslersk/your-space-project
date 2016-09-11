class Image < ApplicationRecord
  belongs_to :venue
  has_many :listings, through: :venue

  validates :image, presence: {message: 'Please upload an image'}
  validates :description, presence: {message: 'Please enter a description'}

  has_attached_file :image, styles: { thumb: "100x100" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
