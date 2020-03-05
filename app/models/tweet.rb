class Tweet < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :text, presence: true
  validates :text, length: { maximum: 140 }
  validates :images, length: { maximum: 4 }
end
