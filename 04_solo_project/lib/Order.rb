class Order
  attr_reader :order

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add(item, number)
    raise 'Item not on the menu' unless menu_includes_item(item)
    raise 'Item not in stock' if item_out_of_stock(item)

    @order << [item, price_of_item(item, number), number]
    stock_of_item_decreases(item, number)
  end

  def complete_order
    @completed_order = FinishMyOrder.new(self)
    @completed_order.receipt
    @completed_order.send_text
  end

  private

  def menu_includes_item(item)
    @menu.includes_item(item)
  end

  def item_out_of_stock(item)
    @menu.item_out_of_stock(item)
  end

  def price_of_item(item, number)
    @menu.price_of_item(item) * number
  end

  def stock_of_item_decreases(item, number)
    @menu.stock_of_item_decreases(item, number)
  end
end
