require 'menu'

class Order
#let customers order a takeaway
attr_reader :basket

  def initialize(menu)
    @basket = {}
    @menu = menu
  end

  def add_item(item, quantity)
    fail NoItemError, "No such dish" unless menu.has_item?(item)
    basket[item] = quantity
  end

  def total
    calculate_price.reduce(:+)
  end

  private

  attr_reader :menu

  def calculate_price
    items.map {|item, quantity| menu.price(item) * quantity}
  end
end

class NoItemError < StandardError; end
