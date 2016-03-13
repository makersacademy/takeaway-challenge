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

  def confirm_order(assumed_total)
    error_message = "Order does not match total of #{@order.calc_total}"
    raise error_message unless matches_total?(assumed_total)
  end

private

  def on_menu?(dish)
    @menu.include? dish
  end

  def matches_total?(assumed_total)
    @order.calc_total == assumed_total
  end

end
