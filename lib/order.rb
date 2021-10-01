class Order 
  attr_reader :menu, :selected_items, :total_order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def place_order(item1 = nil, item2 = nil, item3 = nil)
    @selected_items = @menu.available_items.slice(item1, item2, item3)
    @total_order = @menu.available_items.fetch_values(item1, item2, item3)
  end

  def order_total
    total = @total_order.inject(0, :+)
    @selected_items.delete(:nil)
    p "Thank you for placing your order. You have ordered: #{selected_items.keys}. Your total is £#{total}."
  end

end