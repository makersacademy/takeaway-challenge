require_relative 'menu'
require_relative 'order'
require_relative 'text'
class Takeaway

attr_reader :menu, :order, :text
def initialize(menu=Menu.new, order=Order.new, text=Text.new)
  @menu = menu.read
  @order = order
  @text = text
end

  def add_order(dish,number)
    @order.add_order(dish,number)
    print "#{number}x #{dish.to_s}(s) is added to your basket"
  end

  def basket
    @order.basket
  end

  def checkout
    @order.checkout
    @text
    print "Your total order is £#{@order.total}"
  end

end
