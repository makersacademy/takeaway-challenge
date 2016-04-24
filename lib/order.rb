require_relative 'order_calculator'
require_relative 'message_system'

class Order

  def initialize(order_calculator: OrderCalculator.new, message_system: MessageSystem.new)
    @dishes_ordered = []
    @order_calculator = order_calculator
    @message_system = message_system
  end

  def add(dish, quantity)
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

end
