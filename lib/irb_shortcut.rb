require_relative 'dish'
require_relative 'available_dishes'

margherita = Dish.new("Margherita", 7)
pepperoni = Dish.new("Pepperoni", 8)
ham_and_mushroom = Dish.new("Ham and mushroom", 9)

# p margherita.name

available_dishes = AvailableDishes.new([margherita, pepperoni, ham_and_mushroom])

puts available_dishes.show_dishes
