require_relative 'menu'

class Order

  attr_reader :basket, :menu
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add_order(item, quantity = DEFAULT_QUANTITY)
    raise "This item is not on the menu" unless @menu.menu.include?(item)
    quantity.times { @basket << item.split.map(&:capitalize).join(" ") }
  end

end
