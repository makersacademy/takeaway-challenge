class PizzaPlace

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.prints
  end

  def place_order(items)
    items.each do |item, quantity| 
      order.add(item, quantity)
    end
  end

end
