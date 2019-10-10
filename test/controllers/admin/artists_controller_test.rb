require 'test_helper'

class Admin::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_artists_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_artists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_artists_destroy_url
    assert_response :success
  end

end
