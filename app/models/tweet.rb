class Tweet < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :text, presence: true
  validates :text, length: { maximum: 140 }
  validates :images, length: { maximum: 4 }
end
