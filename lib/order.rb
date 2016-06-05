require_relative 'menu'

class Order

  attr_reader :menu, :customer_order

  def initialize(menu)
    @menu = menu
    @customer_order = {}
  end

  def add(item, quantity)
    raise 'Dish not available' unless @menu.has_dish?(item)
    @customer_order[item] = quantity
  end

  private

  def has_dish?
    !menu[item].nil?
  end
end
