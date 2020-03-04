require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Restaurant

  # WHICH IS THE BEST WAY FOR INITIALIZING?
  #
  # def initialize
  #   @menu = Menu.new
  #   @order = Order.new
  #   @message = Message.new
  # end

  def initialize(menu: Menu.new, order: Order.new, message: Message.new)
    @menu = menu
    @order = order
    @message = message
  end

  def see_menu
    @menu.print_menu
  end

  def place_order(dish, amount)
    @order.add_dish(dish, amount)
  end

  def checkout
    @order.finish_order
    @message.send_message
  end

  # CALL FOR LOOP IN ORDER CLASS

  # def place_order
  #   @order.add_dish
  #   @order.finish_order
  # end
end
