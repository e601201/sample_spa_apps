require "test_helper"

class PersonSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get person_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get person_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get person_sessions_destroy_url
    assert_response :success
  end
end
