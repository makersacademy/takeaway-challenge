require_relative 'message_sender'

class Order

  attr_reader :order_items

  def initialize
    @order_items = []
  end

  def add_item(menu_item)
    @order_items << menu_item
  end

  def print_total
    "The running total of your order is £#{total}"
  end
  
  def print_order
    "Your order details are: #{pretty_print}"
  end

  def place_order(estimated)
    raise "Incorrect total, please try again" if estimated != total
    "Order successfully placed!"
  end

  extend Message_sender

  private
  
  def total
    @order_items.map { | dish |
      dish.price
    }.sum
  end

  def pretty_print
    @order_items.map { | dish |
      "#{dish.name}, £#{dish.price} | "
    }.join
  end

end