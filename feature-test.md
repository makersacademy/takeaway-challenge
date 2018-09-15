*As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices*

load './lib/menu.rb'
load './lib/dish.rb'
dish = Dish.new("Lasagna", 10)
menu = Menu.new
menu.show == []
dish = Dish.new("Lasagna", 10)
dish.price == 10
dish.name == "Lasagna"
menu.add(menu_item)
@menu_item == {dish.name, dish.price}
menu.show == [{"Lasagna" => 10}]
