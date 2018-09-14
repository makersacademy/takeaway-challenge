*As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices*

load './lib/menu.rb'
load './lib/dish.rb'
menu = Menu.new
menu.show == {}


dish = Dish.new
dish.price(10) == 10
dish.price(3) == 3
dish.name("Lasagna")
dish.add("Lasagna", 10)
menu.show == {dish: "Lasagna", price: 10}
