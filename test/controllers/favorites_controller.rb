require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @megadrive = products(:megadrive)
    @switch = products(:switch)
  end

  test "should return my favorite" do
    get favorites_url
    assert_response :success
    end

  test "should create favorite" do
    assert_difference('Product.count', -1) do
    post favorites_url(product_id: @pmegadrive.id)
    end

    assert_redirected_to product_path(@megadrive)
  end

  test "should unfavorite" do
    assert_difference('Favorite.count', -1) do
    delete favorites_url(@switch.id)
    end

    assert_redirected_to product_path(@switch)
  end
end
