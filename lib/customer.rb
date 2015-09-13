require_relative 'twilio'

class Customer

  attr_reader :order, :menu

  def initialize(menu = Menu.new, send_text = TwilioSend.new)
    @order = {}
    @menu = menu.dishes
    @send_text = send_text
  end

  def make_order(dish, quantity)
    fail "Sorry! That dish is not on the menu" unless dish_available?(dish)
    if order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
  end

  def total_dishes
    order.values.reduce(:+)
  end

  def order_summary
    "You have ordered:"
    order.map { |dish, quantity| "#{quantity} #{dish}" }.join(", ")
  end

  def charge
    "You've ordered #{total_dishes} dishes and cost is £#{total_cost}0."
  end

  def confirm_order(customer_response)
    "Would you like confirm your order? y/n"
    customer_response = customer_response.downcase
    if customer_response == "y"
      # send_text.sms
      "Thank you! A text confirmation will be sent shortly."
    else
      "Cancel or revise order."
    end
  end

  private

  def dish_available?(dish)
    menu.key?(dish)
  end

  def total_cost
    order.map { |dish, quantity| self.menu[dish] * quantity }.reduce(:+)
  end

end
