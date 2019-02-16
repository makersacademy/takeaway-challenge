class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{ :dish => "Chicken", :price => "£3.50" },
    { :dish => "Pizza", :price => "£4" }]
  end

  def print_menu
    @dishes.map { |x| x.values.join(" ") }
  end

  def select_dishes(dish, quantity)
    @order = []
    @order << {dish_selected: dish, quantity_selected: quantity}
    @order.map { |x| x.values.join(", ") }
  end

end
