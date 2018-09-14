*As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices*

load './lib/menu.rb'
load './lib/dish.rb'
menu = Menu.new
*should returns menu = {}*
dish = Dish.new
dish.price(10)
dish.name("Lasagna")
menu.show == {dish: "Lasagna", price: 10}
