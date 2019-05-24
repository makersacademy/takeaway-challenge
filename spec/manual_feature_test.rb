require 'dish'

pizza = dish.new("Pizza", 1.50)

pizza.price
# => 1.50

pizza.to_s
# => "Pizza - £1.50"

pizza.name
#  => "Pizza"