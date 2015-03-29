require_relative 'send_text'

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
    @customer_order.inject(0) { |out, (item, qty)| out += (@menu[item] * qty) }
  end

  def confirm_checkout
    out = ""
    @customer_order.inject(out) do |accumulator, (k, v)|
      accumulator << "#{v} x #{k} = £#{@menu[k] * v}\n"
    end
    out << "Total = £#{total_price}"
    out
  end

  def delivery_conf
    fail 'Error' if @customer_order.empty? || !customer_number
    MessageKlass.new.send_text @customer_number, @customer_order
  end
end
