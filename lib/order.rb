require_relative 'order_calculator'
require_relative 'message_system'

class Order

  def initialize(menu:, order_calculator:, message_system:)
    @dishes_ordered = []
    @order_calculator = order_calculator
    @message_system = message_system
    @menu = menu
  end

  def add(dish, quantity)
    fail "Not on menu" unless on_menu?(dish)
    @dishes_ordered << {dish: dish, quantity: quantity}
  end

  def check_total(total)
    err = "Unverified order: total does not match order sum. Change payment."
    fail err unless verified?(total)
    send_msg
  end

  private

  def send_msg
    @message_system.send
  end

  def verified?(total)
    @order_calculator.verified?(total, @dishes_ordered)
  end

  def on_menu?(dish)
    @menu.include_dish?(dish)
  end

end
