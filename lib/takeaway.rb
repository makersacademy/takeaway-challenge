require_relative 'twilio_message'

class Takeaway

  attr_reader :list, :recorded_orders

  def initialize(menu)
    @list = menu.content
    @recorded_orders = []
  end

  def place_order(dish, quantity)
    quantity.times { recorded_orders << dish }
    exact_sum
  end

  def exact_sum
    recorded_orders.map { |x| list[x] }.inject(:+)
  end

  def check(customer_input)
    return successful(customer_input) if self.exact_sum == customer_input
    fail "Your order costs is incorrect"
  end

  def successful(customer_input)
    make_twilio.text_message(customer_input)
  end

  def make_twilio
    TwilioMessage.new
  end

end