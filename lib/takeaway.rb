require_relative 'menu'
require_relative 'order'
require_relative 'text'
class Takeaway

attr_reader :menu, :order_summary, :bill, :bill_summary, :each_check

def initialize(menu=Menu.new, order=Order.new, text=Text.new)
  @menu = menu
  @order = order
  @text = text
end

  def read_menu
    @menu.read
  end

  def add_order(dish,number)
    @order.add_order(dish,number)
    puts "#{number}x #{dish.to_s}(s) is added to your basket"
  end

  def basket
    @order.basket
  end

  def checkout
    @order.checkout
  end

  def confirm_order
    puts "Your total order is £#{@order.total}"
    @text # seems that text is still being send if check bill is not correct.
  end

end
