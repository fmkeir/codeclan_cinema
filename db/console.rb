require('pry')
require_relative('../models/customer')
require_relative('../models/film')

Customer.delete_all()

customer1 = Customer.new({
  "name" => "Neil",
  "funds" => 10
  })
customer1.save

customer2 = Customer.new({
  "name" => "Bill",
  "funds" => 5
  })
customer2.save()

film1 = Film.new({
  "title" => "Jojo Rabbit",
  "price" => 8
  })
film1.save

film2 = Film.new({
  "title" => "In bruges",
  "price" => 5
  })
film2.save

binding.pry
nil
