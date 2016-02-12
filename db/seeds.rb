# include Faker

Recipe.destroy_all
User.destroy_all

5.times do
  User.create!(
  email: Faker::Internet.safe_email,
  name: Faker::Name.name,
  password: Faker::Internet.password(8)
  )
end

15.times do
  Recipe.create!(
  title: Faker::Lorem.word,
  ingredients: Faker::Lorem.words(5),
  body: Faker::Lorem.paragraph,
  source: Faker::Internet.url,
  )
end
recipes = Recipe.all

u = User.new(email: "test@test.com", password: 'password')
u.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Recipe.count} recipes created"
