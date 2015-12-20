require 'test_helper'

class TypesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
