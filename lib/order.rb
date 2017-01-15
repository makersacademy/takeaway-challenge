# knows how to handle an order
require './docs/menu'

class Order

  attr_accessor :menu, :basket

  def initialize(menu = MENU)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(item, n = 1)
    raise "Item is not on the menu" unless available?(item)
    @basket[item] = n
  end

private

  def available?(item)
    @menu.has_key?(item)
  end

end
