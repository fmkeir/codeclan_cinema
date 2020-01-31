require('pry')
require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')
require_relative('../models/screen')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screen.delete_all()

customer1 = Customer.new({"name" => "Neil", "funds" => 10})
customer1.save

customer2 = Customer.new({"name" => "Bill","funds" => 5})
customer2.save()

film1 = Film.new({"title" => "Jojo Rabbit","price" => 8})
film1.save

film2 = Film.new({"title" => "In bruges","price" => 5})
film2.save

ticket1 = Ticket.new({"customer_id" => customer1.id,"film_id" => film1.id})
ticket1.save()

ticket2 = Ticket.new({"customer_id" => customer1.id,"film_id" => film2.id})
ticket2.save()

ticket3 = Ticket.new({"customer_id" => customer2.id,"film_id" => film2.id})
ticket3.save()

screen1 = Screen.new({"capacity" => 10})
screen1.save()
screen2 = Screen.new({"capacity" => 1})
screen2.save()

binding.pry
nil
