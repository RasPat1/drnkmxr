require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  def setup
    validEmail = "ras-book-test-#{Random.rand(100000)}@drnkmxr.com"
    validEmail2= "ras-book-test-fail-#{Random.rand(100000)}@drnkmxr.com"
    invalidEmail= "ras-"
    validZip = "11237"
    invalidZip = "asdfcj1"
    @validBooking = { email: validEmail, zip: validZip }
    @invalidBookingWithBadEmail = { email: invalidEmail, zip: validZip }
    @invalidBookingWithBadZip = { email: validEmail2, zip: invalidZip }
  end

  test "should create new booking" do
    get :create, booking: @validBooking
    response = JSON.parse(@response.body)
    assert response["success"]
  end

  test "should fail to create new booking" do
    get :create, booking: @invalidBookingWithBadEmail
    response = JSON.parse(@response.body)
    assert_not response[:success]
  end

  test "should fail to create new booking because of bad zip" do
    get :create, booking: @invalidBookingWithBadZip
    response = JSON.parse(@response.body)
    assert_not response[:success]
  end
end
