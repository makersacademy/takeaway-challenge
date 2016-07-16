require_relative 'menu'
require_relative 'basket'

class TakeAway
  attr_reader :menu

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def show_menu
    @menu.menu_list
  end

  def take_order(dish, quantity=1)
    fail "Sorry this item is not on the menu" if @menu.dishes[dish].nil?
    @basket.add(dish, quantity)
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def summary
    @basket.order_summary
  end

end
