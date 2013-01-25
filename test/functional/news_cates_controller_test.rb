require 'test_helper'

class NewsCatesControllerTest < ActionController::TestCase
  setup do
    @news_cate = news_cates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_cates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_cate" do
    assert_difference('NewsCate.count') do
      post :create, news_cate: { new_catedesc: @news_cate.new_catedesc, news_catename: @news_cate.news_catename, news_iconurl: @news_cate.news_iconurl }
    end

    assert_redirected_to news_cate_path(assigns(:news_cate))
  end

  test "should show news_cate" do
    get :show, id: @news_cate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news_cate
    assert_response :success
  end

  test "should update news_cate" do
    put :update, id: @news_cate, news_cate: { new_catedesc: @news_cate.new_catedesc, news_catename: @news_cate.news_catename, news_iconurl: @news_cate.news_iconurl }
    assert_redirected_to news_cate_path(assigns(:news_cate))
  end

  test "should destroy news_cate" do
    assert_difference('NewsCate.count', -1) do
      delete :destroy, id: @news_cate
    end

    assert_redirected_to news_cates_path
  end
end
