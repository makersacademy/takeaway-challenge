
class Takeaway
  attr_reader :menu, :order

  def initialize(menu: menu, order: nil )
    @menu = menu
    @order = order
  end

  def display_menu
    menu.display
  end

  def make_order(meals)
    meals.each { |meal, number| order.add(meal, number) }
    order.total_cost
  end

end
