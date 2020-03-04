class Tweet < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :text, presence: true
end
