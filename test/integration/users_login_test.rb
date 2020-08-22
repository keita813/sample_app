require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
def setup
  @user = users(:michael)
end
  # test "login with invalid infomation" do
  # 	# ログイン用のパスを開く
  # 	get login_path
  # 	# 新しいセッションのフォームが正しく表示されたことの確認
  # 	assert_template 'sessions/new'
  # 	# わざと無効な　paramsハッシュを使ってセッション用パスにPOSTする
  # 	post login_path, params: { session: { email: "", password: "" }}
  # 	# あたり強いセッションのフォームが再度表示され、フラッシュが追加されることを確認する
  # 	assert_template 'sessions/new'
  # 	assert_not flash.empty?
  # 	# 別のページにいったん移動する
  # 	get root_path
  # 	# 移動先のページでフラッシュが表示されていないことを確認する
  # 	assert flash.empty?
  # end

  test "login with valid information follwed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_toroot_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
