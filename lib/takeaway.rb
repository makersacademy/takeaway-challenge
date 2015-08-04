require_relative 'twilio_message'

class Takeaway

  attr_reader :list, :recorded_orders, :api

  def initialize(menu)
    @list = menu.content
    @recorded_orders = []
    @api = TwilioMessage.new
  end

  def place_order(dish, quantity)
    fail "Sorry, that dish is not on the menu." unless menu_include?(dish)
    quantity.times { recorded_orders << dish }
    exact_sum
  end

  def exact_sum
    recorded_orders.map { |x| list[x] }.inject(:+)
  end

  def check(customer_input)
    return processing_order(customer_input) if correct?(customer_input)
    fail "Your order costs is incorrect"
  end

  def processing_order(customer_input)
    api.text_message(customer_input)
  end

  private

  def correct?(customer_input)
    exact_sum == customer_input
  end

  def menu_include?(dish)
    list.keys.include?(dish)
  end

end