require "test_helper"

class Admin::NicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_nices_create_url
    assert_response :success
  end
end
