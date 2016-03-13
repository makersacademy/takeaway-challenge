require_relative 'takeaway'
require_relative 'basket'
require_relative 'menu'
require 'dotenv'
Dotenv.load

tw = Takeaway.new

puts tw.menu.list
p tw.basket.content


tw.add('sushi', 5)
p tw.basket.content

p tw.place_order(35)
