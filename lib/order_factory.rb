require_relative 'order'

class OrderFactory

  def initialize(menu, order_class = Order)
    @menu = menu
    @order_class = order_class
  end

  def create_order(order_array)
    items_list = make_items_list(order_array)
    @order_class.new(items_list)
  end

  def make_items_list(order_array)
    order_array.map do |subarray|
      name = subarray[0]
      quantity = subarray[1]
      [@menu.find_item_by_name(name), quantity]
    end
  end

end
