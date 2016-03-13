class Takeaway

  def initialize(menu= Menu.new, order_klass=Order)
    @menu = menu
    @order_klass = order_klass
    @order = @order_klass.new
  end

  def select_item(dish)
    raise "#{dish} is not on the menu." unless on_menu?(dish)
    @order.add_item(dish)
  end

private

  def on_menu?(dish)
    @menu.include? dish
  end

end
