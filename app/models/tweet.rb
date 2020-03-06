class Tweet < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :likes, dependent: :destroy


  validates :text, presence: true
  validates :text, length: { maximum: 140 }
  validates :images, length: { maximum: 4 }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
