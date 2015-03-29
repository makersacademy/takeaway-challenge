# require 'twilio-ruby'

class Takeaway
  attr_reader :menu
  attr_accessor :customer_name, :customer_number, :customer_order

  def initialize
    @menu = { "meal-small": 5, "meal-medium": 10, "meal-large": 15 }
    @customer_order = {}
  end

  def customer name = nil, number = nil
    @customer_name = name
    @customer_number = number
  end

  def show_menu
    @menu.inject("") { |out, (dish, price)| out << "#{dish}: £#{price}\n" }
  end

  def order item
    @customer_order.merge!(item)
  end

  def total_price
    @total = 0
    @customer_order.each do |item, qty|
      @total += (@menu[item] * qty)
    end
    @total
  end

  def confirm_checkout
    checkout_msg = ""
    @customer_order.each do |item, qty|
      checkout_msg << "#{qty} x #{item} = £#{@menu[item] * qty}\n"
    end
    checkout_msg << "Total = £#{total_price}"
    checkout_msg
  end
end
