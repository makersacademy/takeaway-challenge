require_relative 'takeaway'
require_relative 'time'
require_relative 'sms'

class Order

  attr_reader :order_items, :order_total, :menu, :subtotal

  def initialize(menu = Takeaway.new)
    @menu = menu
    @order_items = []
    @order_total = []

  end

  def add_to_order(item, quantity)

    fail "Item does not exist" unless @menu.display_menu.include?(item)

    @subtotal = 0
    quantity.times do
      @order_items.push(item)
      @subtotal += @menu.display_menu[item]
    end
    @order_total.push(@subtotal)
    "#{quantity}x #{item} added to order. Subtotal £#{@subtotal}"

  end

  def display_order
    "Current order: #{order_items.uniq.map { |x| "#{order_items.count(x)}x #{x}" }.join(', ')}"
  end

  def display_total
    "Order total: £#{@order_total.sum}" 
  end

  def place_order(sms = Sms.new)
    order_message
    sms.send_sms
  end

  def order_message(time = Time.new)
    delivery_time = time.time_in_an_hour
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

end
