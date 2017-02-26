require_relative 'order'
require_relative 'menu'
require_relative 'text_confirmation'

class Restaurant

  def initialize(menu = Menu.new, order = Order.new, text_confirmation = TextConfirmation.new)
    @menu = menu
    @order = order
    @text_confirmation = text_confirmation
  end

  def read_menu
    @menu.food_options
  end

  def make_selection(food_order, quantity = 1)
    @order.order_received(food_order, quantity)
  end

  def order_summary
    @order.current_order
  end

  def place_order
    @text_confirmation.order_finished(@order.current_order)
    #Following comment introduced whilst trying to fix a failing test,
    #Test is failing whilst adding new functionality: sending text.
    #"Your order will arrive at #{time.hour + 1}.#{time.min}"
  end

end
