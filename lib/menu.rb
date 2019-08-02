require 'order'

class Menu


attr_reader :food, :order, :menu, :printed_menu



  def initialize(order_class = Order, printed_menu = Printed_menu.new)
    @order_class = order_class
    @printed_menu = printed_menu

  end

  def print_food
    printed_menu.print_printed_menu
    end


#do all the dependency injection for the order class for add food (to basket)












    def add(item)
      order = @order_class.new
      order.add(item)
    end



end



# @food.map do |item, price|
#   "#{item} : £#{price}"
