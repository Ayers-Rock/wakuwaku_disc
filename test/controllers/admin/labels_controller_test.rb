require 'test_helper'

class Admin::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_labels_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_labels_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_labels_destroy_url
    assert_response :success
  end

end
