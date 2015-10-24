require_relative 'send_sms'
require_relative 'restaurant'

class Takeaway

  attr_reader :menu, :order

  def initialize(restaurant_klass=Restaurant)
    @restaurant = restaurant_klass
    @order = Hash.new(0)
  end

  def available
    "Available cuisines: #{@restaurant::CUISINES.keys}"
  end

  def new_order(cuisine=:Italian)
    @menu = @restaurant.new(cuisine).menu
    "A new order has been opened. Please read the menu"
  end

  def add(item, quantity=1)
    if menu.include?(item)
      order[item] += quantity
      "#{item} x#{quantity} has been added to your order"
    else
      "Sorry, your selection is unavailable"
    end
  end

  def delete(item, quantity=1)
    if order.include?(item)
      order[item] -= quantity
      "#{item} x#{quantity} has been deleted from your order"
    else
      "Sorry, your order does not contain that item"
    end
  end

  def order_summary
    summary = order.map { |item,quantity| "#{item} x#{quantity} = #{gbp(menu[item]*quantity)}" }.join(', ')
    "Your order: "+summary
  end

  def total
    "Your total: #{gbp(order_total)}"
  end

  def cancel_order
    reset
    "Order cancelled."
  end

  def place_order
    confirmed? ? confirmation_message : "Please try again"
  end

  private

  # attr_reader :order

  def confirmed?
    print "To confirm your order please repeat the total amount: "
    gets.chomp.to_f == order_total
  end

  def order_total
    order.map { |item,quantity| menu[item]*quantity }.reduce(:+)
  end

  def reset
    @order = Hash.new(0)
  end

  def confirmation_message
    send_sms
    reset
    "Your order has been confirmed! A confirmation text will be sent to your mobile. See you next time!"
  end

  def send_sms
    SendSMS.new(order_summary, total)
  end

  def gbp(amount)
    format("£%.2f",amount)
  end

end
