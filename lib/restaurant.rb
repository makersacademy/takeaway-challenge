require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Restaurant

  attr_reader :messenger

  def initialize(menu = Menu.new, order = Order.new, messenger = Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def show_menu
    menu.dishes
  end

  def place_order(dish, quantity = 1)
    an_order = menu.select_dish(dish)
    order.take_order(an_order, quantity)
  end

  def check_order
    order.check_order
  end

  def check_total
    order.total_cost
  end

  def confirm_order
    messenger.send_text
    @order = Order.new
  end


  private

  attr_reader :menu, :order


end