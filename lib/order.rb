require_relative 'takeaway'
require_relative 'time'
require_relative 'sms'

class Order

  attr_reader :order_items, :order_total, :menu, :subtotal, :running_total

  def initialize(menu = Takeaway.new)
    @menu = menu
    @order_items = []
    @order_total = []
    @running_total = 0
  end

  def add_to_order(item, quantity)

    fail "Item does not exist" unless @menu.display_menu.include?(item)

    @subtotal = 0
    quantity.times do
      @order_items.push(item)
      @subtotal += @menu.display_menu[item]
    end
    @order_total.push(@subtotal)
    @running_total += @subtotal
    "#{quantity}x #{item} added to order. Subtotal £#{@subtotal}"
  end

  def display_order
    fail "Basket empty" if @order_items.empty?

    "Current order: #{order_items.uniq.map { |x| "#{order_items.count(x)}x #{x}" }.join(', ')}"
  end

  def display_total
    fail "Incorrect total" if order_total.sum != @running_total
    fail "Basket empty" if @order_items.empty?

    "Order total: £#{@order_total.sum}"
  end

  def place_order(sms = Sms.new)

    fail "Basket empty" if @order_items.empty?
    order_message
    sms.send_sms
  end

  def order_message(time = Time.new)
    delivery_time = time.time_in_an_hour
    "Thank you for ordering from Ralph's Pizza! Your food will be delivered before #{delivery_time}"
  end

end
