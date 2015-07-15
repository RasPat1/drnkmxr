class BookingsController < ApplicationController
  def create
    @booking = Booking.new(:zip => params[:booking][:zip])

    if @booking.save
      # @booking.send_booking_email
      # render "success"
    else
      # render "fail"
    end
    # save user info
    # send us an email with that info
    # return a partial with the thank you message
    render nothing: true
  end
end
