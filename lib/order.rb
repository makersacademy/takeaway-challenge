require_relative 'takeaway'
require_relative 'menu'

class Order

  attr_reader :order_list, :menu

  def initialize
    @order_list = {}
    @menu = Menu::MENU
  end

  def add(item, quantity = 1)
    fail "Item is not on the menu" unless on_menu?(item)

    @order_list[item.downcase.to_sym] = quantity
  end

  private

  def on_menu?(item)
    @menu[item.to_sym]
  end

end
