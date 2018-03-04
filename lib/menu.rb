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
    selection = @menu.select { |option| option[:item] == item }
    @order.order_item(selection[0])
  end

  def deselect_item(item)
    selection = @menu.select { |option| option[:item] == item }
    @order.remove_item(selection[0])
  end

  def place_order
    @printer.formatter(@order.current_order)
    @order.confirm_order
  end
end
