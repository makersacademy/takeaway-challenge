# Order functionality: stores a customer's order

require_relative "takeaway"
require_relative "menu"

class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemERROR, "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)
  # Method takes two parameters: a dish and a quantity for that dish.  If the
  # dish is not included in the menu (guard condition uses "has_dish?" method -
  # see below) then an error message is rasied.
    dishes[dish] = quantity
  # Updates the dishes hash with key value pairs, where the key is the dish
  # argument passed in to the add method and the value is the quantity argument
  # passed in to the add method.
  end

  def total
    item_totals.inject(:+).round(2)
  # Injects the sum method to total up the items in the array of item totals
  # created by the item_totals method below.  The .round(2) rounds the resulting
  # overall total to two decimal places.
  end

  private

  attr_reader :menu

  def item_totals
    dishes.map { |dish, quantity| menu.price(dish) * quantity }
  # Iterates over the dishes hash and executes the block of code.  The block
  # calls the price instance method of the Menu class on the menu.  Doing so
  # uses the dish title as the key to look up the corresponding price of that
  # menu item. The result is an array showing the item totals ordered, e.g.
  # [19.98, 2.99, 5.97]
  end

end

class NoItemERROR < StandardError; end
