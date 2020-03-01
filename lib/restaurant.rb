require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Restaurant

  def initialize
    @menu = Menu.new
    @order = Order.new
    @message = Message.new
  end

  def see_menu
    @menu.print_menu
  end

  def place_order(dish, amount)
    @order.add_dish(dish, amount)
  end

  def checkout
    @order.finish_order
    # @message.send_message # (IT BREAKS THE TESTS AS TWILIO NOT WORKING)
  end

  # CALL FOR LOOP IN ORDER CLASS

  # def place_order
  #   @order.add_dish
  #   @order.finish_order
  # end
end
