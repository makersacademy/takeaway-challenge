require_relative './twilio_client.rb'

class Order
  def initialize
    @basket = Hash.new(0)
  end

  def see_menu
    
  end

  def add(item, qty)
    raise 'Please choose valid menu option' if not_on_menu?(item)
    raise 'Quantity must be a valid integer' if not_a_number?(qty)

    @basket[item.to_sym] += qty
  end

  def basket
    @basket.dup
  end

  def review
    puts "Your order"

    @basket.each do |item, qty|
      subtotal = MENU[item] * qty
      puts "x#{qty} #{item}, #{price_format(subtotal)}"
    end

    puts "Total: #{price_format(order_total)}"
  end

  def place_order(name, mobile_number)
    process_order(name, mobile_number)
  end

  private

  def not_on_menu?(item)
    MENU[item.to_sym] == nil
  end

  def not_a_number?(qty)
    qty.class != Integer || qty.negative?
  end

  def price_format(num)
    "£#{sprintf('%.2f', num)}"
  end

  def order_total
    @basket.reduce(0) { |sum, (item, qty)| sum + MENU[item] * qty }
  end

  def process_order(name, mobile_number, sms_client = TwilioClient.new)
    sms_client.send_order_confirmation(name, mobile_number)
  end
end