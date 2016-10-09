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
    items = order.collect do |item|
      "#{item.quantity} x #{item.item.name}: £#{item.cost}"
    end
    total = "Order total: £#{total_cost}"
    (items << total).join(", ")
  end

  def checkout(amount = 0)
    fail "You haven't ordered any items!" if order.empty?
    fail "Please pay the correct amount!" if amount != total_cost
    delivery_time = (Time.now + 3600).strftime("%k:%M")
    "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end

  private
  attr_reader :menu, :order

  def total_cost
    order.collect { |item| item.cost }.reduce(0, :+)
  end

end
