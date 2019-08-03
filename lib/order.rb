require_relative 'menu'

class Order
  attr_reader :total_order

  def initialize
    @total_order = []
  end

  def add_item(item, amount = 1)
    item_ordered = {}
    item_ordered[item] = amount
    @total_order << item_ordered
  end

  def total_cost
    my_menu = Menu.new
    cost = 0
    @total_order.each do |order_hash|
      order_hash.each do |item, quantity|
        per_item_cost = my_menu.menu[item]
        cost_of_items = per_item_cost * quantity
        cost += cost_of_items
      end
    end
    cost
  end

end
