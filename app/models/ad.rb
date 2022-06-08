class Ad < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :ratings
  has_many :rentals
  validates :title, :location, :color, :cable_length, :brand, :number_of_plug, :price, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
