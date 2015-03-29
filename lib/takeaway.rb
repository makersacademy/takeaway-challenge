# require 'twilio-ruby'

class Takeaway
  attr_reader :menu
  attr_accessor :customer_name, :customer_number, :customer_order

  def initialize
    @menu = { "meal-small": 5, "meal-medium": 10, "meal-large": 15 }
    @customer_order = {}
  end

  def customer name, number
    @customer_name = name
    @customer_number = number
  end

  def show_menu
    @menu.inject("") do |show_menu, (dish, price)|
      show_menu << "#{dish}: £#{price}\n"
    end
  end

  def order item
    @customer_order.merge!(item)
  end

  def total_price
    puts @customer_order
    @total = 0
    @customer_order.each do |item, qty|
      @total += (@menu[item] * qty)
    end
    @total
  end
end
