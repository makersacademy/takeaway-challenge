require_relative './order'

class Takeaway
  attr_reader :order, :menu_items

  def initialize(menu_items: nil, order: nil)
    @menu_items = MenuItems.new
    @order = order || Order.new(menu_items)

  end

  def display_menu_items
    menu_items.display
  end

  def customer_order(customer_order)
    customer_order.each do |item, amount|
      order.add(item, amount)
    end
  end
end