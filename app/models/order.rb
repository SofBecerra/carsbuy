class Order < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :purchase_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
