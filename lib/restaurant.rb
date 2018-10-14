class Restaurant

  def initialize(*foods)
    @menu = Menu.new(foods)
  end

  def new_order(mobile_num)
    @order = Order.new(mobile_num)
  end

  def add(item, quantity)
    @order.add(item, quantity)
  end

  def remove(item)
    @order.remove(item)
  end

  def read_menu
    @menu.view
  end

  def view_order
    @order.view
  end

  def pay
    check_bill
  end
end
