# require_relative 'menu'
#
# class Basket
#
#   def initialize(menu = Menu.new)
#     @basket= {}
#     @menu = menu
#   end
#
#   def add(dish, quantity)
#     @menu.dishes.each do |dish, price|
#       if dish == dish.to_sym
#         @basket["#{quantity}x #{dish}"] = price*quantity
#       end
#     end
#   end
#
#   def basket_summary
#     @basket.each do |dishes, cost|
#     return "#{dishes}"
#     end
#   end
#
#   def total
#     @total = @basket.values.inject { |total, price| total + price }
#     puts "£#{@total}"
#   end
#
# end
