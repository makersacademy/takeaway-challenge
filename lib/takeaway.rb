require_relative './menu.rb'
require_relative './order.rb'
require_relative './twilio_client.rb'

class Takeaway
  attr_reader :current_order

  def initialize(menu = Menu.new, current_order = Order.new, sms_client = TwilioClient.new)
    @menu = menu
    @current_order = current_order
    @sms_client = sms_client
  end

  def see_menu
    @menu.user_menu
  end

  def add_item(item, qty)
    raise 'Please choose valid menu option' if not_on_menu?(item)
    raise 'Quantity must be a valid integer' if not_a_number?(qty)

    @current_order.add(item, qty)
  end

  def review_order
    puts "Your order"

    @current_order.basket.each do |item, qty|
      subtotal = @menu.dishes[item] * qty
      puts "x#{qty} #{item}, #{price_format(subtotal)}"
    end

    puts "Total: #{price_format(order_total)}"
  end

  def place_order(name, mobile)
    process_order(name, mobile)
  end

  private

  def not_on_menu?(item)
    @menu.raw_menu[item.to_sym] == nil
  end

  def not_a_number?(qty)
    qty.class != Integer || qty.negative?
  end

  def price_format(num)
    "£#{sprintf('%.2f', num)}"
  end

  def order_total
    @current_order.basket.reduce(0) do |sum, (item, qty)| 
      sum + @menu.dishes[item] * qty
    end
  end

  def process_order(name, mobile)
    @sms_client.send_order_confirmation(mobile, message(name))
    @current_order = Order.new
  end

  def message(customer_name)
    str1 = "Thank you for your order #{customer_name}.\n"
    str2 = "Your food will be delivered in 30-45 minutes.\n"
    str3 = "Order summary\n"
    str4 = ""
    str5 = "Total: #{price_format(order_total)}.\n"

    @current_order.basket.each do |item, qty|
      subtotal = @menu.dishes[item] * qty
      str4 << "x#{qty} #{item}, #{price_format(subtotal)}\n"
    end

    str1 + str2 + str3 + str4 + str5
  end
end