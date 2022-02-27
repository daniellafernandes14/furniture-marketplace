# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "Removing seeds..."
Product.delete_all

def attach_photo(object, url, item = true)
  file = URI.open(url)
  if item
    object.photos.attach(io: file, filename: 'image.png', content_type: 'image/png')
  else
    object.photo.attach(io: file, filename: 'image.png', content_type: 'image/png')
  end
end

puts "Adding users..."
laurel = User.create( name: 'Laurel',
                      email: 'laurel1@email.com',
                      password: 'password')
attach_photo(laurel, 'https://static01.nyt.com/images/2019/11/17/books/review/17Salam/Salam1-superJumbo.jpg?quality=75&auto=webp', false)

derrick = User.create(name: 'Derrick',
                      email: 'derrick1@email.com',
                      password: 'password')
attach_photo(derrick, 'https://www.mantruckandbus.com/fileadmin/media/bilder/02_19/219_05_busbusiness_interviewHeader_1485x1254.jpg', false)

puts "Adding products..."
armchair = Product.new( name: 'Armchair',
                        category: 'Lounging',
                        colour: 'White',
                        material: 'Cotton',
                        user: laurel,
                        address: '16 Villa Gaudelet, Paris')
attach_photo(armchair, 'https://cdn.shopify.com/s/files/1/3004/4124/products/b1efaecc-6582-423b-9b81-2dce84b2eb8a.png?v=1621982343')
attach_photo(armchair, 'https://cdn.shopify.com/s/files/1/3004/4124/products/LizzieChair-_welcometo_no50_2000x2000.png?v=1625070926')

table = Product.new(name: 'Table',
                    category: 'Dining',
                    colour: 'Brown',
                    material: 'Wooden',
                    user: laurel,
                    address: '18 Althorpe Mews, London')
attach_photo(table, 'https://cdn.shopify.com/s/files/1/3004/4124/products/b7a23b45-b72c-4636-957b-a40204ffbeca.png?v=1617969443')
attach_photo(table, 'https://cdn.shopify.com/s/files/1/3004/4124/products/71y7yCVEM_2BL._AC_SL1500_2000x2000.jpg?v=1617969443')

lamp = Product.new( name: 'Lamp',
                    category: 'Lighting',
                    colour: 'Yellow',
                    material: 'Glass',
                    user: derrick,
                    address: '18 Althorpe Mews, London')
attach_photo(lamp, 'https://www.iconiclights.co.uk/media/catalog/product/cache/e2f58982b83e61e3558a98d5d4d0ed56/b/2/b2773_c.jpg')
attach_photo(lamp, 'https://www.iconiclights.co.uk/media/catalog/product/cache/e2f58982b83e61e3558a98d5d4d0ed56/b/2/b2773.jpg')

products = [armchair, table, lamp]

products.each do |product|
  product.save!
  puts "Successfully added: #{product.name}"
end

puts "Finished!"
