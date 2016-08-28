require 'menu'

class Order
#let customers order a takeaway
attr_reader :basket, :menu

  def initialize(menu)
    @basket = {}
    @menu = menu
  end

  def add_item(item, quantity)
    fail NoItemError, "No such dish" unless menu.has_item?(item)
    basket[item] = quantity
  end

  # private
  #
  # attr_reader :menu

end

class NoItemError < StandardError; end
