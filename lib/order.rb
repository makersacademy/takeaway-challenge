require_relative 'menu'

class Order

  attr_accessor :order_content, :order_total
  attr_reader :takeaway_menu

  def initialize(takeaway_menu)
    @takeaway_menu = takeaway_menu
    @order_content = []
    @total_cost = 0
  end

  def add_dish dish, quantity
    # raise 'Dish not on menu!' unless @takeaway_menu.include?(dish)
    quantity.times { order_content << dish }
  end


end



# def place_order
#
# end
#
# def total_cost
#
# end
