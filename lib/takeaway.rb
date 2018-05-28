class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print

  end

  def place_order(dishes)
    dishes.each do |dish, amount|
      order.add(dish, amount)
    end
  end

end
