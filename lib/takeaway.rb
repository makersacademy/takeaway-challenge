require_relative 'order'
# require_relative 'text'

class Takeaway

attr_reader :menu

  def initialize(order_class = Order, text = nil)
    @order = Order.new
  end

  def read_menu
    @menu = @order.sorted_by_name
    @menu
  end

  def order_food(dish_name, number)
    @dish_name = dish_name
    @number = number
    @order.select_dish(@dish_name, @number)
    @order.ordered_total
    @order.place_order
  end

end

takeaway = Takeaway.new
takeaway.read_menu
takeaway.order_food("NACHOS", 2)
