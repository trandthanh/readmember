class Card < ApplicationRecord
  belongs_to :user
  has_many :notes

  validates :category, inclusion: { in: ["Book", "Article", "Magazine"], message: "%{value} is not a valid card category." }
end
