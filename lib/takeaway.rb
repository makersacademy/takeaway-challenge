require './lib/order'
require './lib/message'

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def show
    menu.show
  end

  def place_order(dishes)
    add(dishes)
  end

  private

  attr_reader :menu, :order, :message

  def add(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end
