require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get suppliers_index_url
    assert_response :success
  end

  test "should get newsupplier" do
    get suppliers_newsupplier_url
    assert_response :success
  end

  test "should get edit" do
    get suppliers_edit_url
    assert_response :success
  end

  test "should get delete" do
    get suppliers_delete_url
    assert_response :success
  end

  test "should get details" do
    get suppliers_details_url
    assert_response :success
  end

end
