require_relative 'menu'
require_relative 'texting'
require_relative 'order'
require_relative 'item'

class Restaurant

  attr_reader :order

  def initialize(*foods)
    @menu = Menu.new(foods)
    @texter = Texter.new
  end

  def new_order
    @order = Order.new
  end

  def add(item, quantity)
    @order.add(item, quantity)
  end

  def remove(item)
    @order.remove(item)
  end

  def menu
    @menu.view
  end

  def view_order
    @order.view
  end

  def place_order
    msg = "Thanks, your order will arrive before #{time_now}"
    @texter.send(msg)
  end

  private

  def time_now
    t = Time.new + 60 * 60
    t.strftime("%I:%M%p")
  end
end
