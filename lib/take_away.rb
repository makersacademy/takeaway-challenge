require './lib/menu.rb'

class TakeAway

  attr_reader :basket, :menu, :show_menu, :bill, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @bill = []
    @total = 0
  end

  def view_menu
    menu.show_menu
  end

  def place_order(dish, quantity)
    sum = menu.price_of_dish(dish).to_f * quantity.to_f
    basket << "#{dish} X #{quantity} = £#{sum}"
    @bill << sum
    @total += (menu.price_of_dish(dish).to_f * quantity.to_i)
    "#{quantity} X #{dish} added to your basket"
  end

  def check_order
    print "#{basket.join("\n") }\n"
    print "Total = £#{@total}"
  end

end
