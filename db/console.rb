require('pry')
require_relative('../models/customer')

Customer.delete_all()

customer1 = Customer.new({
  "name" => "Neil"
  "funds" => 10
  })
customer1.save

customer1 = Customer.new({
  "name" => "Neil"
  "funds" => 10
  })
customer2.save()

binding.pry
nil
