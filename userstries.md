<!-- As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices -->

irb
require './lib/menu.rb'
menu = Menu.new
name = 'xyz'
price = 10
menu.add_dish(name, price)
menu.display == [{Name: name, Price: price}]
