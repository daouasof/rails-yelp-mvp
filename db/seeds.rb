puts 'Cleanning the db...'
Restaurant.destroy_all
Review.destroy_all
puts 'creating 10 restaurants & 1 to 5 reviews per restaurant'

10.times do
  resto = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber,
    category: %w[chinese italian japanese french belgian].sample
  )
  puts "The restaurant with the id #{resto.id} was created"

  rand(0..5).times do
    review = Review.create!(
      restaurant: resto,
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
    puts "The review with the id #{review.id} for the restaurant #{resto.name} was created"
  end
end
