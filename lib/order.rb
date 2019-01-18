class Order
  attr_reader :ordered, :menu

  def initialize(restaurant_menu)
    @ordered = []
    @menu = restaurant_menu
  end

  def add(dish, quantity)
    raise "#{dish} is not on the menu!" unless (menu.dishes).has_key?(dish.to_sym)
    @ordered << { dish: dish, quantity: quantity }
  end

# menu.dishes = Hash
# Chicken: 2.99, Beef: 3.49
#

end


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes


# Receipt?
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
