require './docs/menu'

class Order

  attr_reader :menu, :basket, :order_summary_array

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @order_summary_array = []
  end

  def display_menu
    @menu.show_menu
  end

  def add_dish(dish, quantity)
    @basket[dish] = quantity
  end

  def cost
    menu_for_price = Menu.new
    menu_hash = menu_for_price.menu_items
    basket_hash = @basket
    menu_hash
    basket_hash
    multiply = menu_hash.map { |k, v| v * basket_hash[k] if basket_hash.key? k }.compact
    total_cost = multiply.inject(:+)
    total_cost
  end

  def view_summary(total_cost)
    "Item summary: #{basket}. Order total: £#{total_cost}"
  end

end
