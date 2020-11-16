require 'application_system_test_case'

class EventsTest < ApplicationSystemTestCase
  test 'Visit Event Index' do
    event = FactoryBot.create(:event)
    visit event_path(event)
    assert_selector 'h1', text: event.name
  end
end
