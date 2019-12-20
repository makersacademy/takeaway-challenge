include './order'

class Takeaway
  attr_reader :order
  def initialize(order)
    @order = order

  end

  def display_menu_items
    "Pepperoni Pizza: 12.99"
  end

  def customer_order(customer_order)
    customer_order.each do |item, amount|
      order.add(item, amount)
    end
  end
end