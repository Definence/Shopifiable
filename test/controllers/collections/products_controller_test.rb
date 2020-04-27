require 'test_helper'

class Collections::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get collections_products_show_url
    assert_response :success
  end

end
