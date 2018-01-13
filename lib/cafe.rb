require_relative 'order'
require_relative 'menu'

class Cafe

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def read_menu
    @menu.show
    ask_for_order
  end

  def order_me(item, quantity = 1)
    @order.add_to_order(item, quantity)
    "You have ordered #{item}."
  end

  def total_correct?(customer_calc)
    return "Your total is correct." if @order.check(customer_calc)
    "Your total is incorrect."
  end

  def checkout
    "Please pay £#{@order.total}."
  end

  private

  def ask_for_order
    "What would you like to order?"
  end

end
