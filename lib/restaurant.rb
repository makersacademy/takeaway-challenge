require 'menu'
require 'sms'

class Restaurant

  def initialize menu=Menu.new, sms=SMS.new
    @menu = menu
    @sms = sms
    @orders = {}
  end

  def menu
    @menu.list_items
  end

  def place_order customer, items, payment
    verify_order(items)
    verify_bill(items, payment)
    orders[customer.name.to_sym] = {order: items}
    message = "Hi #{customer.name},
              your order will be delivered
              at #{time_in_one_hour}.
              Thank you."
    sms.send_sms(customer.tel_no, message)
  end

  private

  attr_reader :orders, :sms

  def time_in_one_hour
    Time.now + 3600
  end

  def verify_order items
    items.each do |i|
      fail "Invalid order" unless menu.keys.include? i
    end
  end

  def verify_bill items, payment
    prices = generate_price_array(items)
    fail "Incorrect payment" unless payment == calculate_bill(prices)
  end

  def generate_price_array items
    items.map { |i| menu[i] }
  end

  def calculate_bill item_array
    item_array.inject(:+)
  end

end
