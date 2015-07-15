class Booking < ActiveRecord::Base
  validates :zip, presence: true

end