class Restaurant

  attr_reader :order

  def initialize(*foods)
    @menu = Menu.new(foods)
  end

  def new_order(mobile_num)
    @order = Order.new(mobile_num)
  end

  def add_to_basket(item, quantity)
    @order.add(item, quantity)
  end

  def read_menu
    @menu.view
  end

  def check_bill
    @order.view
  end

  def pay
  end
end
