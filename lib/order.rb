require './lib/sms_confirmation.rb'

# Understands taking an order
class Order

  attr_reader :order, :menu, :item, :quantity

  def initialize(menu)
    initialize_error_checks(menu)
    @order = {}
    @menu = menu
  end

  def add_item(item, quantity)
    raise 'Please enter a valid dish!' unless menu.items.has_key?("#{item}")
    order.has_key?("#{item}") ? order["#{item}"] += quantity : order["#{item}"] = quantity
    "#{item} x #{quantity} has been added to your order."
  end

  def confirm_price(price)
    raise 'Price does not match total value' if price != calculate_total_price
    "Order total is correct."
  end

  def confirm_order(sms = SmsConfirmation.new)
    sms.send_message
    @order = {}
    'Please check your phone for order updates.'
  end

  def subtotal
    "£#{'%.2f' % calculate_total_price}"
  end

  private

  def initialize_error_checks(menu)
    raise 'Please provide a valid menu!' unless menu.instance_of? Menu
    raise 'The menu you have provided has no items!' if menu.items.empty?
  end

  def calculate_total_price
    total_price = 0
    order.each { |item, quantity| total_price += quantity * menu.items[item] }
    total_price
  end
end
