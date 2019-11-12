require './lib/menu.rb'

class Order
  attr_reader :order_list

  def initialize(menu)
    @menu = menu
    @order_list = [] #Array containing sets of [item, quantity]
  end

  # Adds the menu item and quantity to the order
  def add_item(item, quantity)
    raise "Item not on menu" if on_menu?(item) == false
    @order_list << [item, quantity]
  end

  # Checks that an item added to an order is actually on the menu
  def on_menu?(item)
    names_list = []
    @menu.item_list.each do |item|
      names_list << item.name
    end
    names_list.include?(item)
  end

  # Takes the name of an item on the menu and returns its price
  def item_cost(order_item)
    item_address = nil
    n = 0
    @menu.item_list.each do |item|
      item_address = n if item.name == order_item
      n += 1
    end
    raise "Item not found" if item_address == nil
    matched_item = @menu.item_list[item_address]
    matched_item.price
  end

  # order_total - returns the total for the order
  def order_total

  end

  # place_order(total) - 'pays' for the order and places it.
  # returns the placed status and delivery time (1 hour from current)
  # Implements the text messaging API
end
