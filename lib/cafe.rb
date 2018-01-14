require_relative 'order'
require_relative 'menu'
# require_relative 'messager'

class Cafe

  attr_reader :menu, :order, :message

  def initialize
    @menu = Menu.new
    @order = Order.new
    # @messager = Messager.new
  end

  def read_menu
    @menu.show
    ask_for_order
  end

  def order_me(item, quantity = 1)
    raise 'This item is not on the menu.' unless @menu.includes?(item)
    @order.add_to_order(item, quantity)
    "You have ordered #{item} x#{quantity}."
  end

  def checkout(customer_calc)
    raise "Please pay the correct amount of £#{@order.total}." unless @order.check(customer_calc)
    order_is_confirmed
  end

  def order_is_confirmed
    # @messager.confirm_order
    "Thank you for £#{@order.total}."
  end

  private

  def ask_for_order
    "What would you like to order?"
  end

end
