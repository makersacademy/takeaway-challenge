class TakeAway
  attr_reader :menu, :order

  def initialize(menu, order)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.display
  end

  def take_order(meal)
    meal.each { |name, quantity| order.add(name, quantity) }
    order.total
  end
end
