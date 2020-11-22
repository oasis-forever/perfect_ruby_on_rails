# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner = User.first

500.times do |i|
  Event.create!(
    name: "Event#{sprintf('%03d', i)}",
    place: 'Tokyo',
    content: 'This is a sample event.',
    start_at: Time.zone.now.since(1.day),
    end_at: Time.zone.now.since(1.day).since(3.hours),
    owner: owner
  )
end
