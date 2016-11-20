class Takeaway

attr_reader :order

  def initialize(menu:, order: nil)
  @menu = menu
  @order = order || Order.new
  end

  def print_menu
    menu.print
  end

  def order_takeaway(dishes)
    dishes.map do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu

end
