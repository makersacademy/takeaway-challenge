class Customer
  attr_reader :menu, :order, :order_items

  def initialize(menu, order)
    @menu = menu
    @order_items = {}
    @order = order
  end

  def choose(choice)
    @order_items[choice] = @menu.items[choice]
  end

  def place_order(total)
    order.add_order_items(@order_items)
    order.add_menu_items(@menu.items)
    order.place_order(total)
  end

end
