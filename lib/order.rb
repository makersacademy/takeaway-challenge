require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @menu = Menu.new
    @order = []
  end


  def add_pizza(selected_dish, quantity = 1)
    raise "item not on offer" if !menu_includes_dish?(selected_dish)
    @order << [selected_dish, quantity]
  end


   def claculate_price(food, quantity = 1)
     dish_price(food) * quantity
    # sum = 0
    # @order.each do |order|
    #   sum += dish_price(order[0]) * order[1]
    # end
    # sum
  end

  def menu_includes_dish?(selected_dish)
    @menu.dish_avaliable?(selected_dish)
  end

  def dish_price(dish)
    sum = 0
    Menu::PIZZA_MENU.each do |food|
      if food[:dish] == dish
        sum = food[:price]
      end
    end
    return sum
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
