class BookingsController < ApplicationController
  def create
    @booking = Booking.new(
      :zip => params[:booking][:zip],
      :email => params[:booking][:email])
    result = {success: false, message: 'Sorry, try again'}
    if @booking.save # save user info
      # send us an email with that info
      @booking.send_booking_submitted
      result[:success] = true
      result[:message] = "Thanks for registering with drnk|mxr"
    end

    # return a partial with the thank you message
    render json: result
  end
end
