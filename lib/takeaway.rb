require_relative 'menu'
require_relative 'pretty_format'
require_relative 'order'
require_relative 'send_sms'

class Takeaway

  include SMS
  include Menu
  include PrettyFormat

  def initialize
    puts "\nWelcome to Shirt and Thai!\n"
    menu
  end

  def menu
    pretty_format(ALL_DISHES)
  end

  def order(dish, quantity, total_cost)
    raise "Total cost given does not match calculated order total" if order_error?(dish, quantity, total_cost)
    @current_order ||= Order.new
    @current_order.add(dish, quantity)
    confirm_add
  end

  def basket
    puts "\nBASKET:\n"
    pretty_format(@current_order.basket, @current_order.total)
  end

  def checkout(account_sid=nil, auth_token=nil, twilio_phone=nil, customer_phone=nil)
    raise "Your basket is currently empty" if !@current_order
    puts "\nThank you for your order!\n\nORDER DETAILS:\n"
    basket
    puts "You should receive an SMS message shortly confirming your order\n\n"
    send
  end

  private

  def order_error?(dish, quantity, total_cost)
     (ALL_DISHES.values[(dish - 1)].to_f * quantity) != total_cost
  end

  def confirm_add
    menu
    puts "Item(s) successfully added to basket\n"
    basket
  end

end
