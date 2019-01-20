class Takeaway
  def initialize(menu, order)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_basket(items)
    @order.add(items)
    'Added to Basket'
  end

  def basket
    @order.items
  end

  def total
    @order.total
  end
end
