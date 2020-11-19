require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "The events of owner can be deleted" do
    event_owner = FactoryBot.create(:user)
    event       = FactoryBot.create(:event, owner: event_owner)
    sign_in_as(event_owner)
    assert_difference('Event.count', -1) do
      delete event_path(event)
    end
  end

  test "The events of other owners cannot be deleted" do
    event_owner  = FactoryBot.create(:user)
    event        = FactoryBot.create(:event, owner: event_owner)
    sing_in_user = FactoryBot.create(:user)
    sign_in_as(sing_in_user)
    assert_difference('Event.count', 0) do
      assert_raise(ActiveRecord::RecordNotFound) do
        delete event_path(event)
      end
    end
  end
end
