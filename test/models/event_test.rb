require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'Argument ID of #created_by? is equal to owner_id' do
    event = FactoryBot.create(:event)
    user = MiniTest::Mock.new.expect(:id, event.owner_id)
    assert_equal(true, event.created_by?(user))
    user.verify
  end

  test 'Argument ID of #created_by? is not equal to owner_id' do
    event = FactoryBot.create(:event)
    user  = FactoryBot.create(:user)
    assert_equal(false, event.created_by?(user))
  end

  test 'Argument ID of #created_by? is equal to nil' do
    event = FactoryBot.create(:event)
    assert_equal(false, event.created_by?(nil))
  end

  test 'Validation of start_at_should_be_before_end_at is OK' do
    start_at = rand(1..30).days.from_now
    end_at   = start_at + rand(1..30).hours
    event    = FactoryBot.build(:event, start_at: start_at, end_at: end_at)
    event.valid?
    assert_empty(event.errors[:start_at])
  end

  test 'Validation of start_at_should_be_before_end_at is error' do
    start_at = rand(1..30).days.from_now
    end_at   = start_at - rand(1..30).hours
    event    = FactoryBot.build(:event, start_at: start_at, end_at: end_at)
    event.valid?
    assert_not_empty(event.errors[:start_at])
  end
end
