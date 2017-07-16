require_relative 'menu'

class Order

  attr_reader :menu, :ordered_dishes

  def initialize(menu = Menu.new)
    @menu = menu
    @ordered_dishes = Hash.new
  end

  def read_menu
    menu.print_menu
  end

  def order_dish(name, quantity)
    ordered_dishes[name] = quantity
  end

  def total_amount
    total = ordered_dishes.map { |name, quantity| menu.dishes[name] * quantity }
    total.inject(0) { |sum, amount| sum + amount }
  end
end
