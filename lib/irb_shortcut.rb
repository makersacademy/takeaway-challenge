require_relative 'dish'
require_relative 'available_dishes'
require_relative 'shopping_cart'

margherita = Dish.new("Margherita", 7)
pepperoni = Dish.new("Pepperoni", 8)
ham_and_mushroom = Dish.new("Ham and mushroom", 9)

# p margherita.name

available_dishes = AvailableDishes.new([margherita, pepperoni, ham_and_mushroom])

# puts available_dishes.show_dishes

cart = ShoppingCart.new(available_dishes)
p cart.cart_contents
p cart.available_dishes

selected_dish = available_dishes.array_of_dishes.find { |dish| dish.name == "Non-dish" }
p selected_dish.nil?

cart.add_dish("Non-dish")

selected_dish = available_dishes.array_of_dishes.find { |dish| dish.name == "Margherita" }
p selected_dish

