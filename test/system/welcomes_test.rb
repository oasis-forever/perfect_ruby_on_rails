require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  test 'Visit Welcome Page' do
    visit root_path
    assert_selector 'h1', text: 'イベント一覧'
  end
end
