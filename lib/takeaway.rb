require_relative 'order'
require_relative 'menu'
require_relative 'text_confirmation'

class Takeaway

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
    @order.string_summary
  end

  def place_order
    send_text("Thank you for your order: £#{@order.bill}")
  end

  private

  def send_text(order_total)
    @text_confirmation.order_finished
  end

end
