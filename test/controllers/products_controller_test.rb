require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_index_url
    assert_response :success
  end

  test "should get new_product" do
    get products_new_product_url
    assert_response :success
  end

  test "should get details" do
    get products_details_url
    assert_response :success
  end

  test "should get edit" do
    get products_edit_url
    assert_response :success
  end

end
