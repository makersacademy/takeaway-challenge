class Takeaway

  attr_reader :dish_selection, :quantity, :sum, :total

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @sum = 0
    @order = order
    @total = 0
  end

  def menu
    @menu.see
  end

  # def total
  #   @total += sum
  # end

  # def order(dish_selection, quantity)
  #   @order_list << { dish_selection: dish_selection, quantity: quantity }
  #   @dish_selection = dish_selection
  #   @quantity = quantity
  # # end
  def place_order(dish_selection, quantity)
    @dish_selection = dish_selection
    @quantity = quantity
    @order.place(dish_selection, quantity)
  end

  # def sum
  #   @sum += menu_list[dish_selection] * quantity
  # end

  # def sum
  #   @sum += menu_list[dish_selection] * quantity
  # end

# private
#
#   def menu_list
#     @menu.list
#   end

end
