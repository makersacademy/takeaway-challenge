require_relative "menu"

class Order
  attr_reader :menu, :order, :item

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def add_item(item)
    @item = item
    @order << item if item_exists?
  end

  def check_order
    order
  end

  private

  def item_exists?
    menu.menu.each {|menu_item| return true if menu_item[:item] == item[:item]}
    raise "Item does not exist: Please select a different item"
  end
end
