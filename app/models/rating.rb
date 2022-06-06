class Rating < ApplicationRecord
  belongs_to :ad

  validates :user_id, :ad_id, :rate, presence: true
  validates_inclusion_of :rate, :in => 1..5
end
