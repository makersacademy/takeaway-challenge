# new class 'Order'
require './lib/menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(item, quantity = 1)
    fail "Please enter a valid food selection!" unless @menu.menu_items.include?(item)
    fail "Please enter a valid number of items!" unless quantity >= 1
    quantity.times { @basket << item }
  end

  def cost
    total_cost = 0
    @basket.each do |item|
      total_cost += @menu.menu_items[item]
    end
    total_cost
  end

  def display_order
    current_order = "#{@basket.count} items in your order:\n"
    @basket.each do |item|
      current_order += "#{item} : £#{@menu.menu_items[item]}\n"
    end
    current_order += "Total Cost £#{cost}"
  end
end
