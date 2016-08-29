require_relative 'menu'
require_relative 'order'
require_relative 'confirmation'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @order = Order.new
  end

  def show_menu
    menu.show_dishes
  end

  def add(dish, number=1)
    fail 'Sorry, that\'s not on the menu' unless menu.contains?(dish)
    add_to_basket(dish, number)
  end

  def summary
    order.summary
  end

  def checkout(payment, confirmation = Confirmation.new)
    fail 'Nothing in basket' if order.empty?
    fail 'Please enter the correct payment amount' if payment != order.total
    confirmation.send_message
  end

  private

  def add_to_basket(dish, number)
    order.add_dish(dish, number)
    puts "#{dish} has been added to your basket"
  end

  attr_reader :menu, :order

end
