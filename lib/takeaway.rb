class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print
  end

  def order_takeaway(food)
    food.each do |dish, num|
      order.add(dish, num)
    end
    return order.total
  end

private

  attr_reader :menu, :order

end
