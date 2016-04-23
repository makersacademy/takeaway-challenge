require_relative 'order_calculator'
class Order

  def initialize(order_calculator: OrderCalculator.new)
    @dishes_ordered = []
    @order_calculator = order_calculator
  end

  def add(dish, quantity)
    @dishes_ordered << {dish: dish, quantity: quantity}
  end

  def check_total(total)
    err = "Unverified order: total does not match order sum. Change payment."
    msg = "Thank you!"\
    " Your order was placed and will be delivered before #{calculate_time}"
    fail err unless verified?(total)
    msg
  end

  private

  def calculate_time
    one_hour = Time.now + 60*60
    one_hour.localtime.strftime("%H:%M")
  end

  def verified?(total)
    @order_calculator.verified?(total, @dishes_ordered)
  end

end
