require_relative "order"

class Takeaway

  attr_reader :menu, :order

  def initialize(menu, order)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def show_menu
    menu
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end
