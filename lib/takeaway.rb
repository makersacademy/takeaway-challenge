require 'order_item'
require 'order'

class Takeaway
  def initialize(menu, time, sms_notifier)
    @menu = menu
    @order = Order.new
    @sms_notifier = sms_notifier
    @time = time
  end

  def view_menu
    menu.items
  end

  def order_item(selection, quantity = 1)
    item = menu.order(selection)
    ordered_item = OrderItem.new(item, quantity)
    order.add_item(ordered_item)
    ordered_item
  end

  def review_order
    order.summary
  end

  def checkout(amount = 0)
    fail "You haven't ordered any items!" if order.empty?
    fail "Please pay the correct amount!" if amount != order.total_cost
    message = delivery_message
    sms_notifier.send(message)
    message
  end

  private
  attr_reader :menu, :order, :sms_notifier, :time

  def delivery_message
    delivery_time = (time.now + 3600).strftime("%k:%M")
    "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end


end
