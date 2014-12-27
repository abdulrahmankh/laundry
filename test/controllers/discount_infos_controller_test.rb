require 'test_helper'

class DiscountInfosControllerTest < ActionController::TestCase
  setup do
    @discount_info = discount_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discount_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discount_info" do
    assert_difference('DiscountInfo.count') do
      post :create, discount_info: { active: @discount_info.active, amount: @discount_info.amount, discount: @discount_info.discount }
    end

    assert_redirected_to discount_info_path(assigns(:discount_info))
  end

  test "should show discount_info" do
    get :show, id: @discount_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discount_info
    assert_response :success
  end

  test "should update discount_info" do
    patch :update, id: @discount_info, discount_info: { active: @discount_info.active, amount: @discount_info.amount, discount: @discount_info.discount }
    assert_redirected_to discount_info_path(assigns(:discount_info))
  end

  test "should destroy discount_info" do
    assert_difference('DiscountInfo.count', -1) do
      delete :destroy, id: @discount_info
    end

    assert_redirected_to discount_infos_path
  end
end
