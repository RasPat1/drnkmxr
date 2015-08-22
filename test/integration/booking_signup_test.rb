# Assert form fields exist
# Fill in forms
# submit forms
# make sure corect info leads to the new message
# make sure incorrect fields leads to fail message

require 'test_helper'

class BookingSignupTest < ActionDispatch::IntegrationTest
  def setup
    @validEmail = "test-#{Random.rand(10000)}@test.com"
    @invalidEmail = "test-#{Random.rand(10000)}"
    @validZip = "12345"

  end

  test "fill out signup form and book successfully" do
    get root_path
    assert_template 'static_pages/home'

    post bookings_path booking: {email: @invalidEmail, zip: @validZip}
    assert_response :success, false
    assert_equal 0, ActionMailer::Base.deliveries.size

    post bookings_path booking: {email: @validEmail, zip: @validZip}
    assert_equal 1, ActionMailer::Base.deliveries.size
    booking = assigns(:booking)
    assert_equal @validEmail, booking.email
    assert_equal @validZip, booking.zip
    assert_response :success
  end
end
