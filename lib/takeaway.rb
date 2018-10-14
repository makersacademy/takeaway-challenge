
class Takeaway
  attr_reader :menu, :order
  def initialize(menu: menu, order: order)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.display
  end

  def order_request(meals)
    meals.each {|meal, quantity| order.add(meal, quantity) }
    order.total_cost
  end

end
