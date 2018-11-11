require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Restaurant
  attr_reader :menu, :order, :message

  def initialize(menu = Menu.new, order = Order.new, message = Message.new)
    @menu = menu
    @order = order
    @message = message
  end

  def show_menu
    @menu.show
  end

  def add_to_basket(dish, quantity=1)
    @order.add_dish(dish, quantity)
  end

  def check_basket
    @order.check
  end








end
