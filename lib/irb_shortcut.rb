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
# p cart.cart_contents
# p cart.available_dishes

cart.add_dish("Margherita")
cart.add_dish("Pepperoni")
# p cart.cart_contents

# sum = 0
# cart.cart_contents.each do |dish|
#   dish.price
#   sum += dish.price
# end
# p sum

p cart.total
