class Order 
  attr_reader :menu, :selected_items, :total_order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def place_order(item1 = nil, item2 = nil, item3 = nil)
    @selected_items = @menu.available_items.slice(item1, item2, item3)
    @item_prices = @menu.available_items.fetch_values(item1, item2, item3)
  end

  def order_total
    total = @item_prices.inject(0, :+)
  end
  
  def order_confirmation
    @selected_items.delete(:nil)
    p selected_items
    p "Thank you for placing your order at Aisha's Bistro. You have ordered: #{selected_items.keys}. Your total is £#{order_total}."
  end


end