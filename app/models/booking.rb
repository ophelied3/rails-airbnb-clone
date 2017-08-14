class Booking < ApplicationRecord
  belongs_to :horse_id
  belongs_to :user_id
end
