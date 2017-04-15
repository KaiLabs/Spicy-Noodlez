require 'test_helper'

class TradingPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trading_post = trading_posts(:one)
  end

  test "should get index" do
    get trading_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_trading_post_url
    assert_response :success
  end

  test "should create trading_post" do
    assert_difference('TradingPost.count') do
      post trading_posts_url, params: { trading_post: { notes: @trading_post.notes, price: @trading_post.price, title: @trading_post.title } }
    end

    assert_redirected_to trading_post_url(TradingPost.last)
  end

  test "should show trading_post" do
    get trading_post_url(@trading_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_trading_post_url(@trading_post)
    assert_response :success
  end

  test "should update trading_post" do
    patch trading_post_url(@trading_post), params: { trading_post: { notes: @trading_post.notes, price: @trading_post.price, title: @trading_post.title } }
    assert_redirected_to trading_post_url(@trading_post)
  end

  test "should destroy trading_post" do
    assert_difference('TradingPost.count', -1) do
      delete trading_post_url(@trading_post)
    end

    assert_redirected_to trading_posts_url
  end
end
