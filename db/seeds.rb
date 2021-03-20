# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#u = Farmer.create(user_id: 2, farm_name: "The Best Farm")
#u.save!

#customer = User.create(email: 'testconsumer@testemail.com', password: "password", admin: false, account_type: "consumer")
#customer.skip_confirmation!
#customer.save!

#c = Consumer.create(user_id: 4)
#c.save!

cart = ShoppingCart.create(consumer_id: 1)
cart.save!

#u2 = User.create(email: 'email3@email.com', password: "password", admin: true, account_type: "farmer")
#u2.skip_confirmation!
#u2.save!

