require './lib/menu.rb'

class Order
  attr_reader :items, :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @items = {}
  end

  def add(item, quantity)
    @items[item] = {price: menu.dishes[item], quantity: quantity}
  end
end
