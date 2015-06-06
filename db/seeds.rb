User.create!(name: "Example User",
  email: "example@drnkmxr.com",
  password: "boss candy",
  password_confirmation: "boss candy",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@drnkmxr.com"
  password = "jkjk!!234"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end