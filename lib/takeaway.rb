require_relative 'send_sms'
require_relative 'restaurant'

class Takeaway

  attr_reader :menu, :order

  def initialize(restaurant_klass=Restaurant)
    @restaurant = restaurant_klass
  end

  def whats_available
    @restaurant::MENUS.keys
  end

  def new_order(type=:Italian)
    reset_order
    @menu = @restaurant.new(type).menu
    "A new order has been opened. Please read the menu"
  end

  def add(item, quantity=1)
    menu.include?(item) ? adds_with_message(item, quantity) : "Sorry, your selection is unavailable"
  end

  def delete(item, quantity=1)
    order.include?(item) ? delete_with_message(item, quantity) : "Sorry, your order does not contain that item"
  end

  def order_summary
    "Your order: #{summary.join(' ')}"
  end

  def total
    "Your total: #{in_GBP(order_total)}"
  end

  def cancel_order
    reset_order
    "Order cancelled."
  end

  def place_order
    confirmed? ? confirmation_message : "Please try again"
  end

  private

  def summary
    summary = order.map { |i,q| "#{i} x#{q} = #{in_GBP(item_value(i, q))}" }
  end

  def confirmed?
    print "To confirm your order please repeat the total amount: "
    gets.chomp.to_f == order_total
  end

  def order_total
    order.map { |item,quantity| item_value(item, quantity) }.reduce(:+)
  end

  def reset_order
    @order = Hash.new(0)
  end

  def reset_menu
    @menu = "Please open a new order"
  end

  def confirmation_message
    send_sms
    reset_order
    reset_menu
    "Your order has been confirmed! A confirmation text will be sent to your mobile. See you next time!"
  end

  def send_sms
    SendSMS.new(order_summary, total)
  end

  def item_value(item, quantity)
    menu[item]*quantity
  end

  def in_GBP(amount)
    format("£%.2f",amount)
  end

  def delete_with_message(item, quantity)
    order[item] -= quantity
    "#{item} x#{quantity} has been deleted from your order"
  end

  def adds_with_message(item, quantity)
    order[item] += quantity
    "#{item} x#{quantity} has been added to your order"
  end

end
