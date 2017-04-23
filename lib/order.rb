require_relative 'menu'

class Order

  attr_reader :order_items

  def initialize
    @order_items = []
    @order_price = 0
  end

  def select_dish(from_menu)
    raise 'That item is not on the menu' unless Menu::MENU.include?(from_menu)
    @order_items << from_menu
    @order_price += PRICE
  end

  private

  PRICE = 2.00

end
