class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings

  CATEGORY = ['Lighting', 'Dining', 'Lounging']
end
