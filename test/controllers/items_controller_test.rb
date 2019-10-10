require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get rankings" do
    get items_rankings_url
    assert_response :success
  end

  test "should get ranking" do
    get items_ranking_url
    assert_response :success
  end

  test "should get show" do
    get items_show_url
    assert_response :success
  end

  test "should get index" do
    get items_index_url
    assert_response :success
  end

end
