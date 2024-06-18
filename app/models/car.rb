class Car < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :photos
end
