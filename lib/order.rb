require_relative 'menu.rb'
require_relative 'send_sms.rb'

class Order
  attr_reader :basket
  def initialize(basket = Hash.new)
    @basket = basket
  end

  def add_dish(number, quantity = 1)
    dish_name = Menu.new.dishes[number].first
    dish_cost = Menu.new.dishes[number].last
    @basket[dish_name] = [dish_cost, quantity]
    @basket
  end

  def basket_summary(basket)
    basket.map { |name, cost| [name, cost[0] * cost[1]] }.to_h
  end

  def total_cost(summary)
    summary.values.inject(&:+)
  end

  def print_receipt(basket_summary, total_cost)
    details = basket_summary.map do
      |name, cost| "#{name}  £#{cost / 100.0}"
    end.join("\n")
    details + "\n-----------------------\n" + "Total:  £#{total_cost / 100.0}"
  end

  def place_order(payment_amount, summary, time = Time.now)
    raise "Sorry, the payment amount is incorrect" if payment_amount != total_cost(summary)
    @time = (time + 3600).strftime("%H:%M")
    "Thank you! Your order was placed and will be delivered before #{@time}"
  end

  def send_confirmation
    SMS.send_sms("Thank you! Your order was placed and will be delivered before #{@time}")
  end

end
