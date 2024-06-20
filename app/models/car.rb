class Car < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :photos

  validates :brand, presence: true
  validates :year, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :information, presence: true
end
