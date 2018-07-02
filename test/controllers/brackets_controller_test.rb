require 'test_helper'

class BracketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brackets_index_url
    assert_response :success
  end

  test "should get new" do
    get brackets_new_url
    assert_response :success
  end

  test "should get show" do
    get brackets_show_url
    assert_response :success
  end

  test "should get edit" do
    get brackets_edit_url
    assert_response :success
  end

end
