class Takeaway

  attr_reader :dish_selection, :quantity, :order_list

  def initialize(menu = Menu.new)
    @menu = menu
    @order_list = []
  end

  def menu
    @menu.see
  end

  def order(dish_selection, quantity)
    @order_list << { dish_selection: dish_selection, quantity: quantity }
    @dish_selection = dish_selection
    @quantity = quantity
  end

end
