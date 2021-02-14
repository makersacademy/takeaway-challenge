class Ordering
  
  def initialize (menu = nil, cart = nil)
    @menu = menu
    @cart = cart
  end

  def menu
    @menu.print
  end

  def view_cart
    @cart.show_cart
  end

  def add_to_order item_name
    item = @menu.available?(item_name)
    raise "#{item_name} not available" if item == false
    @cart.add_to_order(item)
  end
end