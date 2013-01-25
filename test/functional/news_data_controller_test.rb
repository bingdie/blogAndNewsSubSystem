require 'test_helper'

class NewsDataControllerTest < ActionController::TestCase
  setup do
    @news_datum = news_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_datum" do
    assert_difference('NewsDatum.count') do
      post :create, news_datum: { news_content: @news_datum.news_content, news_source: @news_datum.news_source, news_title: @news_datum.news_title }
    end

    assert_redirected_to news_datum_path(assigns(:news_datum))
  end

  test "should show news_datum" do
    get :show, id: @news_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news_datum
    assert_response :success
  end

  test "should update news_datum" do
    put :update, id: @news_datum, news_datum: { news_content: @news_datum.news_content, news_source: @news_datum.news_source, news_title: @news_datum.news_title }
    assert_redirected_to news_datum_path(assigns(:news_datum))
  end

  test "should destroy news_datum" do
    assert_difference('NewsDatum.count', -1) do
      delete :destroy, id: @news_datum
    end

    assert_redirected_to news_data_path
  end
end
