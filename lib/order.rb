require_relative 'takeaway'
require_relative 'sms'


class Order

  attr_reader :customer_order, :item, :menu

  def initialize
    @customer_order = Hash.new(0)
    @menu = Takeaway::MENU
  end

  def add_item(item, quantity)
    fail "Item is not on the menu." unless @menu.include?(item)
    customer_order[item] += quantity
  end

  def total
    "Your total: £#{order_total.round(2)}"
  end

  def order_total
    customer_order.map { |item, quantity| item_value(item, quantity) }.inject(:+)
  end

  def item_value(item, quantity)
    menu[item] * quantity
  end

  def summary
    @customer_order.each { |item, quantity| puts "#{item} x #{quantity}" }; puts total
  end

  def send_sms(phone_number)
    Sms.send_text(phone_number)
    "sent"
  end
end
