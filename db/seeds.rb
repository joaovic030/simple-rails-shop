# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_file = Rails.root.join('db', 'seeds', 'products.yml')
config = YAML::load_file(seed_file)
config.each do |product|
  new_product = Product.new(product.except('brand', 'category'))
  new_product.brand = Brand.find_or_create_by(name: product['brand'])
  new_product.category = Category.find_or_create_by(name: product['category'])

  new_product.save
  print '.'
end
puts 'done'

# Seed users
User.create([{email: 'admin@admin.com', admin: true, password: 'admin123'}, {email: 'ordinary@user.com', admin: false, password: 'ordinary123'}])
# Seed Coupons
Coupon.create([{description: "10% OFF", percentage: 10, expired_date: Date.today+7, activated: true}])