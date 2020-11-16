FactoryBot.define do
  factory :user, aliases: %i(owner) do
    provider { 'github' }
    sequence(:uid) { |i| i }
    sequence(:name) { |i| "ユーザー#{format('%03d', i)}" }
    sequence(:image_url) { |i| "http://example.com/image_#{i}.jpg" }
  end
end
