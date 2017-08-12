require './lib/order_item.rb'

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
end
