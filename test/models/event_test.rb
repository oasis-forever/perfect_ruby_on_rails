require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "Argument ID of #created_by? is equal to owner_id" do
    event = FactoryBot.create(:event)
    user = User.new
    user.stub(:id, event.owner_id) do
      assert_equal(true, event.created_by?(user))
    end
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
