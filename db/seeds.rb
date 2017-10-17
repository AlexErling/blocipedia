require 'faker'

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld',
    confirmed_at: Time.now
  )
end
users = User.all

100.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Superhero.name,
    body: Faker::Superhero.power
  )
end

wikis = Wiki.all

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'admin'
)

premium = User.create!(
  name: 'Premium User',
  email: 'premium@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'premium'
)

standard = User.create!(
  name: 'Standard User',
  email: 'standard@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'standard'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} posts created"