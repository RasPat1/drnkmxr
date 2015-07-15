class StaticPagesController < ApplicationController
  def home
    @bookings = Booking.new
  end

  def help
  end

  def about
  end

  def contact
  end
end
