require "./lib/order"
require "./lib/send_sms"

class Takeaway
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    order.total
  end

  private

  attr_reader :menu, :order

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end
