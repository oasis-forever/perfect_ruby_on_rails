FactoryBot.define do
  factory :user, aliases: %i(owner) do
    provider { 'github' }
    sequence(:uid) { |i| "#{User.human_attribute_name(:uid)}_#{format('%03d', i)}" }
    sequence(:name) { |i| "#{User.human_attribute_name(:name)}_#{format('%03d', i)}" }
    sequence(:image_url) { |i| "http://example.com/image_#{i}.jpg" }
  end
end
