class Movie < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :hotness, numericality: { allow_blank: true }
  validates :image_url, url: { allow_blank: true }
end
