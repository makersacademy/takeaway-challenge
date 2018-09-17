require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @menu = Menu.new
    @order = []
  end


  def add_pizza(selected_dish, quantity = 1)
    raise msg if !menu_includes_dish?(selected_dish)
    @order << [selected_dish, quantity]
  end


   def claculate_price
    sum = 0
    @order.each do |order|
      sum += dish_price(order[0]) * order[1]
    end
    sum
  end

  def menu_includes_dish?(selected_dish)
    @menu.dish_avaliable?(selected_dish)
  end

  def dish_price(dish)
    @menu.dish_price(dish)
  end
end




# require 'menu'
#
# class Order
#
#   attr_reader :takeaway
#
#   def initialize
#     @menu = Menu.new
#     @takeaway = []
#   end
#
#   def add_pizza(selected_dish, quantity = 1)
#     @order << [selected_dish, quantity]
#   end
# end
