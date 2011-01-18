require 'test_helper'

class CatagoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catagories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catagory" do
    assert_difference('Catagory.count') do
      post :create, :catagory => { }
    end

    assert_redirected_to catagory_path(assigns(:catagory))
  end

  test "should show catagory" do
    get :show, :id => catagories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => catagories(:one).to_param
    assert_response :success
  end

  test "should update catagory" do
    put :update, :id => catagories(:one).to_param, :catagory => { }
    assert_redirected_to catagory_path(assigns(:catagory))
  end

  test "should destroy catagory" do
    assert_difference('Catagory.count', -1) do
      delete :destroy, :id => catagories(:one).to_param
    end

    assert_redirected_to catagories_path
  end
end
