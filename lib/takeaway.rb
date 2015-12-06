class Takeaway

  attr_reader :menu, :order, :order_klass

  def initialize(menu, order_klass)
    @menu = menu
    @order_klass = order_klass
    @order = order_klass.new
  end

  def check_menu
    @menu.dishes
  end

  def place_order(dish, qty)
    fail "Not on menu: #{dish}" if not_on_menu?(dish)
    @order.take_order(dish, qty)
  end

  def check_order
    @order.current_order
  end
  def new_order
    @order = order_klass.new
  end

  private

 def not_on_menu?(dish)
   !@menu.dishes.include?(dish)
 end

end
