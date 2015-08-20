require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,            "Bartenders on Demand"
    assert_equal full_title("Help"),    "Help | Bartenders on Demand"
  end
end