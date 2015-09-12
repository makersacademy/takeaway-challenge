
class Customer

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu.dishes
  end

  def make_order(dish, quantity)
    fail "Sorry! That dish is not on the menu" unless dish_available?(dish)
    if order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
  end

  def order_summary
    "You have ordered:"
    order.map do |dish, quantity|
    "#{quantity} #{dish}"
    end.join(", ")
  end

  def charge
    "The total of your order is £#{total_cost}0"
  end

  private

  def dish_available?(dish)
    menu.has_key?(dish)
  end

  def total_cost
    order.map { |dish, quantity| self.menu[dish] * quantity }.reduce(:+)
  end

end
