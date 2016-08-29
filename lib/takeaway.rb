require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new
  end

  def show_menu
    menu.show_dishes
  end

  def add(number=1, dish)
    menu.check_dish(dish)
    add_to_basket(number, dish)
  end

  def summary
    order.summary
  end

  private

  def add_to_basket(number, dish)
    order.add_dish(number, dish)
    puts "#{dish} has been added to your basket"
  end

  attr_reader :menu, :order

end
