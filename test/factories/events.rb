FactoryBot.define do
  factory :event do
    owner
    sequence(:name) { |i| "#{Event.human_attribute_name(:name)}_#{format('%03d', i)}" }
    sequence(:place) { |i| "#{Event.human_attribute_name(:place)}_#{format('%03d', i)}" }
    sequence(:content) { |i| "#{Event.human_attribute_name(:content)}_#{format('%03d', i)}" }
    start_at { rand(1..30).days.from_now }
    end_at { start_at + rand(1..30).hours }
  end
end
