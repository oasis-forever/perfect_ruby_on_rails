require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "Argument ID of #created_by? is equal to owner_id" do
    event = FactoryBot.create(:event)
    user = MiniTest::Mock.new.expect(:id, event.owner_id)
    assert_equal(true, event.created_by?(user))
    user.verify
  end

  test "Argument ID of #created_by? is not equal to owner_id" do
    event = FactoryBot.create(:event)
    user  = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(user))
  end

  test "Argument ID of #created_by? is equal to nil" do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end
end
