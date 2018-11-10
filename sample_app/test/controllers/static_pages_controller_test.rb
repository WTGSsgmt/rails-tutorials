require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # setupという特別なメソッド (各テストが実行される直前で実行されるメソッド)
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
    get static_pages_home_url
    assert_response :success
  end

  # 言葉で表すと
  # 「Homeページのテスト。GETリクエストをhomeアクションに対して発行 (=送信) せよ。そうすれば、リクエストに対するレスポンスは[成功]になるはず。」となります。
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
# テストの実行にはある程度時間がかかります。これには２つの要因が絡んでいます。
# (1) Springサーバーを起動してRails環境を事前読み込みするのに時間がかかる。ただしこれは最初の1回だけです。
# (2) Rubyそのものの起動に時間がかかる (2番目の要因については、3.6.2で紹介するGuardを導入することで改善できます)。
#