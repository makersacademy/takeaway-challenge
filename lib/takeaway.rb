require './lib/order'
require './lib/message'

class Takeaway

  def initialize(menu:, order: nil, message: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @message = message || Message.new(menu)
  end

  def show
    menu.show
  end

  def place_order(dishes)
    add(dishes)
    message.send
    order.total
  end

  private

  attr_reader :menu, :order, :message

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end
