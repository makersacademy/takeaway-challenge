class Order

  attr_reader :order_list, :dish_selection, :quantity

  def initialize
    @order_list = []
  end

  def place(dish_selection, quantity)
    @order_list << { dish_selection: dish_selection, quantity: quantity }
    @dish_selection = dish_selection
    @quantity = quantity
  end

end
