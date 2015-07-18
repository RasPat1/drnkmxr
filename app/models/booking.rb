class Booking < ActiveRecord::Base
  validates :zip, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  def send_booking_submitted
    UserMailer.booking_submitted(self).deliver_now
  end
end