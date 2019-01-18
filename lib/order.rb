class Order
  attr_reader :ordered, :menu

  def initialize(restaurant_menu)
    @ordered = {}
    @menu = restaurant_menu
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

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


# class Order
#
#   attr_reader :dishes
#
#   def initialize(menu)
#     @dishes = {}
#     @menu = menu
#   end
#
#   def add(dish, quantity)
#     fail NoItemError, "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)
#     dishes[dish] = quantity
#   end
#
#   def total
#     item_totals.inject(:+)
#   end
#
#   private
#
#   attr_reader :menu
#
#   def item_totals
#     dishes.map do |dish, quantity|
#       menu.price(dish) * quantity
#     end
#   end
# end
#
# class NoItemError < StandardError; end
