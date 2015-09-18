require_relative 'twilio'

class Customer

  attr_reader :order, :menu

  def initialize(menu = Menu.new, send_text = TwilioSend.new)
    @order = {}
    @menu = menu
    @send_text = send_text
  end

  def make_order(dish, quantity)
    if menu.dish_available?(dish) == true && order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
  end

  def update_order(dish, quantity)
    order[dish] = quantity if order.include?(dish)
  end

  def total_dishes
    order.values.reduce(:+)
  end

  def order_summary
    summary = order.map { |dish, quantity| "#{quantity} #{dish}" }.join(", ")
    "You have ordered: #{summary}"
  end

  def charge
    "You've ordered #{total_dishes} dishes and cost is £#{total_cost}0."
  end

  def confirm_order(customer_response)
    customer_response = customer_response.downcase
    if customer_response == "y"
      send_text.sms(ENV['MOBILE'])
      "Thank you! A text confirmation will be sent shortly."
    else
      "Cancel or revise order."
    end
  end

  private

  def total_cost
    order.map { |dish, quantity| menu.dishes[dish] * quantity }.reduce(:+)
  end

end
