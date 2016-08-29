require_relative 'menu'
require_relative 'order'
class User_input

  def initialize(menu_class: Menu, order_class: Order)
    @order_class = order_class.new
    @menu_class = menu_class
  end

  def begin
    @order_class.begin_order
    @order_class.record_order
    display_order
  end

  def display_order
    puts "You ordered the following items.."
    puts @order_class.basket
    display_total
  end

  def display_total
    puts "We believe your total to be"
    @order_class.total
  end
end
