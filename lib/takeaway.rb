require 'order_item'

class Takeaway
  def initialize(menu, time, sms_notifier)
    @menu = menu
    @order = []
    @sms_notifier = sms_notifier
    @time = time
  end

  def view_menu
    menu.items
  end

  def order_item(selection, quantity = 1)
    item = menu.order(selection)
    ordered_item = OrderItem.new(item, quantity)
    @order << ordered_item
    ordered_item
  end

  def review_order
    items = order.collect do |item|
      "#{item.quantity} x #{item.item.name}: £#{item.cost}"
    end
    total = "Order total: £#{total_cost}"
    (items << total).join(", ")
  end

  def checkout(amount = 0)
    fail "You haven't ordered any items!" if order.empty?
    fail "Please pay the correct amount!" if amount != total_cost
    delivery_time = (time.now + 3600).strftime("%k:%M")
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}."
    sms_notifier.send(message)
    message
  end

  private
  attr_reader :menu, :order, :sms_notifier, :time

  def total_cost
    order.collect { |item| item.cost }.reduce(0, :+)
  end


end
