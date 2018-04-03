require './takeaway.rb'

p takeaway = TakeAway.new

p takeaway.print_dishes

p takeaway.order("Chilli Squid")

p takeaway.order("Crispy Seaweed", 5)

p takeaway.basket

p takeaway.basket_total

p takeaway.place_order(23.9)
