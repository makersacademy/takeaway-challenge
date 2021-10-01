class Takeaway
  attr_reader :items, :available_items, :order, :selected_items

  def menu
    @items = {:chips => 3, :rice => 2, :lamb_shish => 10, :chicken_shish => 10, :lamb_doner => 7, :soft_drink => 2, :nil => 0}
  end

  def available_items
    @available_items = items
  end

  def place_order(item1 = nil, item2 = nil, item3 = nil)
    @selected_items = menu.slice(item1, item2, item3)
    @order = menu.fetch_values(item1, item2, item3)
  end

  def order_total
    total = @order.inject(0, :+)
    p "Thank you for placing your order. Your total is £#{total}."
  end
end