require_relative 'dish_view'

class OrderView
  def initialize(order, dish_view_class = DishView)
    @order = order
    @dish_view_class = dish_view_class
  end

  def display
    items = @order.item_list.reduce("\nORDER\n") do |sum, item|
      sum + @dish_view_class.new(item[0]).display + " x #{item[1]}\n"
    end
    total = "Total: £#{@order.total}"
    items + "#{total.rjust(34)}\n"
  end
end
