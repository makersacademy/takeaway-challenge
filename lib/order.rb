class Order
  def initialize(menu = Menu.new)
    @menu_items = menu
  end

  def place(order_list, total_cost)
    order_cost = order_list.calculate_cost(@menu_items)
    check_total(order_cost, total_cost)
  end

  def check_total(order_cost, total_cost)
    return "order placed" if order_cost == total_cost
    raise "order cost does not match expected cost"
  end
end
