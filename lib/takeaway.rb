require_relative 'menu'
require_relative 'order'
class Takeaway

attr_reader :menu, :order_summary, :basket

def initialize(menu=Menu.new)
  @menu = menu
  @order = Order.new
  @basket = @order.order_summary
end

  def read_menu
    @menu.dish.to_h
  end

  def add_order(dish,number)
    @order.add_order(dish,number)
    puts "#{number}x #{dish.to_s}(s) is added to your basket"
  end

end
