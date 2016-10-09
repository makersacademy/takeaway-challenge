class Takeaway
  def initialize(menu)
    @menu = menu
    @order = []
  end

  def view_menu
    menu.items
  end

  def order_item(selection, quantity = 1)
    item = menu.order(selection)
    ordered_item = OrderItem.new(item, quantity)
    @order << ordered_item
    ordered_item
  end

  def review_order
    summary = order.collect do |item|
      "#{item.quantity} x #{item.item.name}: £#{item.cost}"
    end
    summary.join(", ")
  end

  private
  attr_reader :menu, :order

end
