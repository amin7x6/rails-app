# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['Books', 'TV show', 'Movies', 'Clothes', 'Music', 'Food'].each do |category|
  Category.create(name: category)

end




100.times do
  category = Category.all.sample


  Product.create  title: Faker::Beer.name,
                  Description: Faker::ChuckNorris.fact,
                  price: rand(100),
                  category_id: category.id

end


products = Product.all

products.each do |q|
  rand(0..10).times do
    q.reviews.create({
        body: Faker::RickAndMorty.quote
        rating: rand(1..5)
      })
  end
end

reviews_count = Review.count


puts Cowsay.say 'Created 100 Products', :cow
puts Cowsay.say 'Created reviewss ð®', :cow
puts Cowsay.say "Created #{reviews_count} reviews ð©", :ghostbusters

# 100.times do
#   User.create  first_name: Faker::Name.first_name,
#                   last_name: Faker::Name.last_name,
#                   email: Faker::Internet.email
# end
#
# puts Cowsay.say 'Created 100 User', :cow
