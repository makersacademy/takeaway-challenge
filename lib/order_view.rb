require_relative 'dish_view'

class OrderView
  ORDER = 'ORDER'
  TOTAL = 'Total: '
  def initialize(order, dish_view_class = DishView)
    @order = order
    @dish_view_class = dish_view_class
  end

  def display
    items = @order.item_list.reduce("\n#{ORDER}\n") do |sum, item|
      sum + @dish_view_class.new(item[0]).display + " x #{item[1]}\n"
    end
    total = "#{TOTAL.rjust(32)}" + "£#{format("%.2f", @order.total)}"
    items + "#{total}\n"
  end
end
