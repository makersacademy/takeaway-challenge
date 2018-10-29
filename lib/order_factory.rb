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
      make_item_quantity_list(subarray)
    end
  end

  private

  def make_item_quantity_list(array)
    name = array[0]
    item = @menu.find_item_by_name(name)
    quantity = array[1]
    [item, quantity]
  end
end
