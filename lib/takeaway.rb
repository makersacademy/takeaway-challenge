require "order"
require "messenger"

class Takeaway

  TIME_FORMAT = "%H:%M"

  attr_reader :menu, :order, :messenger

  def initialize(menu:, order: nil, messenger: nil)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def display_menu
    menu.print
  end

  def select_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    messenger.send_message(message)
    order.total
  end

  private
  def order
    @order ||= Order.new(menu)
  end

  def order
    @messenger ||= Messenger.new
  end

  def message
    "Thank you for your order! The delivery should arrive in one hour at #{delivery_time}"
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
