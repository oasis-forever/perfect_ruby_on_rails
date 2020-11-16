require 'application_system_test_case'

class EventsTest < ApplicationSystemTestCase
  test 'Visit Event Index' do
    event = FactoryBot.create(:event)
    visit event_path(event)
    assert_selector 'h1', text: event.name
  end

  test 'Visit Event New' do
    sign_in_as(FactoryBot.create(:user))
    visit new_event_path
    assert_selector 'h1', text: 'イベント作成'
  end
end
