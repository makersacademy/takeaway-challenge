require './lib/menu.rb'

class Order
  attr_reader :order_list

  def initialize
    @order_list = []
  end
  # add_item(item, quantity) - adds the menu item and
  # quantity to the order
  def add_item(item, quantity)
    @order_list << [item, quantity]
  end

  # order_total - returns the total for the order

  # place_order(total) - 'pays' for the order and places it.
  # returns the placed status and delivery time (1 hour from current)
  # Implements the text messaging API
end
