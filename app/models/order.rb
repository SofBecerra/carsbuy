class Order < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
