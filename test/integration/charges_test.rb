require 'test_helper'

class ChargesTest < ActionDispatch::IntegrationTest
  def setup
  end

  test "successful checkout flow" do
    get root_url
    assert_select "a[href=?]", new_charge_path
    get new_charge_path
    assert_template 'charges/new'
  end
end
