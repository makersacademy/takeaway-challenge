require_relative 'menu'
require_relative 'order'
class Takeaway
  attr_reader :menu
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    menu.dishes
  end

  def order(dish, quantity = 1)
    fail 'Sorry, this dish is currently not on the menu' if not_available?(dish)
    puts "#{quantity}x #{dish}(s) added to your basket."
    @order.add(dish, quantity = 1)
  end

  def total
    puts "Total: £#{@order.total}"
  end

private

def not_available?(dish)
  return true if menu.dishes[dish].nil?
end

end
