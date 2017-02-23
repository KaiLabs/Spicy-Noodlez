require 'test_helper'

class LostandfoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lostandfound = lostandfounds(:one)
  end

  test "should get index" do
    get lostandfounds_url
    assert_response :success
  end

  test "should get new" do
    get new_lostandfound_url
    assert_response :success
  end

  test "should create lostandfound" do
    assert_difference('Lostandfound.count') do
      post lostandfounds_url, params: { lostandfound: { foundlocation: @lostandfound.foundlocation, foundtime: @lostandfound.foundtime, item: @lostandfound.item, notes: @lostandfound.notes, picture: @lostandfound.picture, title: @lostandfound.title } }
    end

    assert_redirected_to lostandfound_url(Lostandfound.last)
  end

  test "should show lostandfound" do
    get lostandfound_url(@lostandfound)
    assert_response :success
  end

  test "should get edit" do
    get edit_lostandfound_url(@lostandfound)
    assert_response :success
  end

  test "should update lostandfound" do
    patch lostandfound_url(@lostandfound), params: { lostandfound: { foundlocation: @lostandfound.foundlocation, foundtime: @lostandfound.foundtime, item: @lostandfound.item, notes: @lostandfound.notes, picture: @lostandfound.picture, title: @lostandfound.title } }
    assert_redirected_to lostandfound_url(@lostandfound)
  end

  test "should destroy lostandfound" do
    assert_difference('Lostandfound.count', -1) do
      delete lostandfound_url(@lostandfound)
    end

    assert_redirected_to lostandfounds_url
  end
end
