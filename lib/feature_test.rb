require_relative 'basket'
require_relative 'menu'
require 'dotenv'
Dotenv.load

menu = Menu.new
puts menu.list

basket = Basket.new
p basket.add({name: 'Miso soup', amount: 3, price: 1.5}, {name: 'Okonomi-yaki', amount: 2, price: 10})
p basket.remove({name: 'Miso soup', amount: 3, price: 1.5})
