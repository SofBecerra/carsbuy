class Car < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_one :order, dependent: :destroy
  has_many_attached :photos
  pg_search_scope :search,
                  against: %i[brand year color information],
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :brand, presence: true
  validates :year, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :information, presence: true
end
