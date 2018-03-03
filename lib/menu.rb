class Menu
  attr_reader :menu

  def initialize(printer, order)
    @printer = printer
    @order = order
    @menu = [
      { item: "Devil's Cauliflower", price: 4 },
      { item: "Rainbow Pot", price: 3 },
      { item: "Oreo Brownie", price: 3 },
    ]
  end

  def display_menu
    @printer.formatter(@menu)
  end

  def select_item(item)
    @order.order_item(item)
  end

  def deselect_item(item)
    @order.remove_item(item)
  end
end
