class UserMailer < ApplicationMailer
  # For Bookings
  def booking_submitted(booking)
    @booking = booking
    mail to: "julia@drnkmxr.com", cc: "ras@drnkmxr.com, basil@drnkmxr.com", subject: "Booking submitted"
  end

  #For Users
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end


end
