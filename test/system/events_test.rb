require 'application_system_test_case'

class EventsTest < ApplicationSystemTestCase
  test 'Visit Event Index' do
    event = FactoryBot.create(:event)
    visit event_path(event)
    assert_selector 'h1', text: event.name
  end

  test 'Visit Event New and Create an Event' do
    sign_in_as(FactoryBot.create(:user))
    visit new_event_path
    assert_selector 'h1', text: '新規イベント登録'

    fill_in 'イベント名', with: 'Deep Learning勉強会'
    fill_in 'イベント内容', with: '自然言語処理のための深層学習をPythonで学ぶ'
    fill_in '開催地', with: '東京'

    start_at = Time.current
    start_at_field = 'event_start_at'
    select start_at.strftime('%Y'), from: "#{start_at_field}_1i"
    select I18n.l(start_at, format: '%B'), from: "#{start_at_field}_2i"
    select start_at.strftime('%-d'), from: "#{start_at_field}_3i"
    select start_at.strftime('%H'), from: "#{start_at_field}_4i"
    select start_at.strftime('%M'), from: "#{start_at_field}_5i"

    end_at = start_at.since(3.hours)
    end_at_field = 'event_end_at'
    select end_at.strftime('%Y'), from: "#{end_at_field}_1i"
    select I18n.l(end_at, format: '%B'), from: "#{start_at_field}_2i"
    select end_at.strftime('%-d'), from: "#{end_at_field}_3i"
    select end_at.strftime('%H'), from: "#{end_at_field}_4i"
    select end_at.strftime('%M'), from: "#{end_at_field}_5i"

    click_on '登録する'
    assert_selector 'div.alert', text: 'イベントを登録しました'
  end

  test 'Delete an Event' do
    sign_in_as(FactoryBot.create(:user))
    event = FactoryBot.create(:event, owner: current_user)
    visit event_path(event)
    assert_difference('Event.count', -1) do
      accept_confirm do
        click_on 'イベント削除'
      end
      assert_selector 'div.alert', text: 'イベントを削除しました'
    end
  end
end
