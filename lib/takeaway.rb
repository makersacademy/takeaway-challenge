class Takeaway

  attr_reader :dish_selection, :quantity, :order_list

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order_list = []
    @sum = 0
    @order = order
  end

  def menu
    @menu.see
  end

  # def order(dish_selection, quantity)
  #   @order_list << { dish_selection: dish_selection, quantity: quantity }
  #   @dish_selection = dish_selection
  #   @quantity = quantity
  # # end
  def place_order(dish_selection, quantity)
    @order.place(dish_selection, quantity)
  end

  def check_total
  end

end
