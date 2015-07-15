class Booking < ActiveRecord::Base
  validates :zip, presence: true
  def send_booking_submitted
    UserMailer.booking_submitted(self).deliver_now
  end
end