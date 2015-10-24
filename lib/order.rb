require_relative 'menu'

class Order

  attr_reader :basket, :menu, :balance

  def initialize(menu = Menu)
    @basket = []
    @menu = menu.new
    @balance = 0
  end

  def add_items(item_num, quantity, sum)
    basket << {item_num: item_num, quantity: quantity, total: sum}
    @balance += sum
  end

  def view_menu
    @menu.print_items
  end

  def compare_basket_price
    basket.each do |elem|
      @menu.menu_price_diff(elem[:item_num], elem[:sum] / elem[:quantity])
    end
  end
end