require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  test 'Visit Welcome Page' do
    visit root_path
    assert_selector 'h1', text: 'イベント一覧'
  end

  test 'Past Events are hidden' do
    future_event = FactoryBot.create(:event, start_at: Time.zone.now.since(3.days))
    past_event   = FactoryBot.create(:event, start_at: Time.zone.now.since(1.day))

    travel_to(Time.zone.now.since(2.days)) do
      visit root_path
      assert_selector 'h5', text: future_event.name
      assert_no_selector 'h5', text: past_event.name
    end
  end
end
