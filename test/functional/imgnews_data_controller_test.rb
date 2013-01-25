require 'test_helper'

class ImgnewsDataControllerTest < ActionController::TestCase
  setup do
    @imgnews_datum = imgnews_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imgnews_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imgnews_datum" do
    assert_difference('ImgnewsDatum.count') do
      post :create, imgnews_datum: { imgnews_imgurl: @imgnews_datum.imgnews_imgurl }
    end

    assert_redirected_to imgnews_datum_path(assigns(:imgnews_datum))
  end

  test "should show imgnews_datum" do
    get :show, id: @imgnews_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imgnews_datum
    assert_response :success
  end

  test "should update imgnews_datum" do
    put :update, id: @imgnews_datum, imgnews_datum: { imgnews_imgurl: @imgnews_datum.imgnews_imgurl }
    assert_redirected_to imgnews_datum_path(assigns(:imgnews_datum))
  end

  test "should destroy imgnews_datum" do
    assert_difference('ImgnewsDatum.count', -1) do
      delete :destroy, id: @imgnews_datum
    end

    assert_redirected_to imgnews_data_path
  end
end
