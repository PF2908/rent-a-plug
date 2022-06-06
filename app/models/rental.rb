class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :ad
  validates :user_id, :ad_id, :start_date, :end_date, presence: true
end
