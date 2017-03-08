require 'test_helper'

class ClerksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clerks_index_url
    assert_response :success
  end

  test "should get newclerk" do
    get clerks_newclerk_url
    assert_response :success
  end

  test "should get details" do
    get clerks_details_url
    assert_response :success
  end

  test "should get edit" do
    get clerks_edit_url
    assert_response :success
  end

  test "should get delete" do
    get clerks_delete_url
    assert_response :success
  end

end
