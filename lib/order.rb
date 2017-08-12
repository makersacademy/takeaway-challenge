require_relative './order_item.rb'
require_relative './takeaway_app.rb'

class Order

  attr_reader :contents

  def initialize
    @contents = []
  end

  def receive(order_item)
    @contents << order_item
  end

  def loop_receiving(order_item)
    while order_item.dish_number != ""
      receive(order_item)
      order_item = OrderItem.new
    end
  end

  def total
    sum = 0
    @contents.each do |item|
      sum += (item.quantity.to_i * $menu[item.dish_number.to_i - 1][:price])
    end
    sum
  end
end
