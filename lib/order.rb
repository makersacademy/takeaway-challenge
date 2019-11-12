require './lib/menu.rb'

class Order
  attr_reader :order_list

  def initialize(menu)
    @menu = menu
    @order_list = []
  end
  # add_item(item, quantity) - adds the menu item and
  # quantity to the order
  def add_item(item, quantity)
    raise "Item not on menu" if on_menu?(item) == false
    @order_list << [item, quantity]
  end

  def on_menu?(item)
    names_list = []
    @menu.item_list.each do |item|
      names_list << item.name
    end
    names_list.include?(item)
  end
  # order_total - returns the total for the order

  # place_order(total) - 'pays' for the order and places it.
  # returns the placed status and delivery time (1 hour from current)
  # Implements the text messaging API
end
