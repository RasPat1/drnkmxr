User.create!(name: "Ras Seed Patel",
  email: "ras-seed@drnkmxr.com",
  password: "boss candy",
  password_confirmation: "boss candy",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

10.times do |n|
  name = Faker::Name.name
  email = "name-email-#{n+1}@drnkmxr.com"
  password = "jkjk!!234"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

10.times do |n|
  name = "test-#{n}"
  description = "description for #{n}"
  Drink.create!(name: name, description: description)
end