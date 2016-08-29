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
    fail 'Sorry, that\'s not on the menu' unless menu.contains?(dish)
    add_to_basket(number, dish)
  end

  def summary
    order.summary
  end

  def checkout(payment)
    fail 'Nothing in basket' if order.empty?
    fail 'Please enter the correct payment amount' if payment != order.total
  end

  private

  def add_to_basket(number, dish)
    order.add_dish(number, dish)
    puts "#{dish} has been added to your basket"
  end

  attr_reader :menu, :order

end
