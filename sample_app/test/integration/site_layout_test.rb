require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    # homeページが正しいビューを描画しているかどうかを確かめるassert
    assert_template 'static_pages/home'
    # href=?の?を自動的に対象のpathに変換してくれる
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
