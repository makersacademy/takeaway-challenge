require './r'

tofu = Dish.new('Tasty Tofu',1.50)
fish = Dish.new('Savory Salmon',6.75)
burger = Dish.new('American Cheeseburger',5.85)
steak = Dish.new('Sweet Sirloin',11.0)

service = Takeaway.new

service.add_dish(tofu)
service.add_dish(fish)
service.add_dish(burger)
service.add_dish(steak)

puts service.menu

