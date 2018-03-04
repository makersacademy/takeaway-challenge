require_relative 'menu'

class Order

  attr_reader :items, :menu

  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add(item, quantity)
    raise "#{item.capitalize} is not on our menu, please select another item." unless @menu.dish_available?(item)
    items[item] = quantity
  end

end
