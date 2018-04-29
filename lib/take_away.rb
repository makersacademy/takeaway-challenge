require 'menu'

class TakeAway

  attr_reader :basket, :menu, :show_menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @bill = []
  end

  def view_menu
    show_menu
  end

  def place_order(dish, quantity)
    sum = menu.price_of_dish(dish).to_f * quantity.to_f
    basket << "#{dish} X #{quantity} = £#{sum}"
    @bill << sum
    "#{quantity} X #{dish} added to your basket"
  end
end
