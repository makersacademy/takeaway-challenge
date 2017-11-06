require './lib/menu'

class Order

  attr_reader :order

  def initialize(menu = Menu.new.menu)
    @order = []
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    ordered_dish = (@menu.select { |d| d[:name].match(dish) }) * quantity.to_i
    raise "Please check your dish is on the menu" if ordered_dish.empty?
    add_to_order(ordered_dish)
  end

  def total
    total = 0
    @order.each { |p| total += p[:price] }
    total
  end

  private

  def add_to_order(item)
    @order.concat item
  end
end
