require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by(:selenium, using: :headless_chrome, screen_size: [1400, 1080]) do |option|
    option.add_argument('no-sandbox')
    option.add_argument('--lang=ja-jp')
  end
  include SignInHelper
end
