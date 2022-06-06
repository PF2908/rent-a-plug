class Ad < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :rentals
  validates :title, :location, :color, :cable_length, :brand, :number_of_plug, presence: true
end
