require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = Order.new
  end

  def show_menu
    @menu.print_dishes
  end

  def add_to_order(dish, amount = 1)
    raise "Sorry, that item is not on the menu" unless @menu.dishes.has_key?(dish.to_sym)
    @basket.add(dish.to_sym, amount)
  end

  def basket_summary
    @basket.summary
  end

  def total
    '%.2f' % @basket.list.map { |dish, amount| @menu.dishes[dish] * amount }.sum
  end
end
