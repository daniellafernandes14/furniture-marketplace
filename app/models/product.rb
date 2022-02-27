class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORY = ['Lighting', 'Dining', 'Lounging']
end
