class Image < ApplicationRecord
  belongs_to :venue, optional: true
  has_many :listings, through: :venue

  validates :image, presence: {message: 'Please upload an image'}
  validates :description, presence: {message: 'Please enter a description'}

  has_attached_file :image, styles: { thumb: "300x300", medium: "612x612" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
