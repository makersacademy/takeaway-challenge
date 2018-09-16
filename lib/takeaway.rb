
class Takeaway
  require_relative './menu.rb'
  require_relative './order.rb'

  attr_reader :menu, :order
  
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end
  
  def read_menu
    @menu.show_menu
  end  

  def order_item(name, quantity = 1)
    item = @menu.find_item(name)
    previous_quantity = @order.basket[item] || 0
    @order.basket[item] = previous_quantity + quantity
  end

  def show_order_basket
    @order.show_basket
  end

  def show_order_total
    @order.calculate_total_price
  end

  def show_order_subtotals
    @order.calculate_subtotals  
  end

end
