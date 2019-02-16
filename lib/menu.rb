class Menu

  attr_reader :dishes, :selection

  def initialize
    @dishes = [{ :dish => "Chicken", :price => "£3.50" },
    { :dish => "Pizza", :price => "£4" }]
  end

  def print_menu
    @dishes.map { |x| x.values.join(" ") }
  end

<<<<<<< HEAD
  # def select_dishes(dish, quantity)
  #     @selections = []
  #     @selections << {dish_selected: dish, quantity_selected: quantity}
  #     @selections.map { |x| x.values.join(", ") }
  # end

  def select_dishes(dish, quantity)
    @selections = []
    selection = {dish_selected: dish, quantity_selected: quantity}
    @selections << selection
=======
  def select_dishes(dish, quantity)
    @order = []
    @order << {dish_selected: dish, quantity_selected: quantity}
    @order.map { |x| x.values.join(", ") }
>>>>>>> 7b3ebab4aabd03c627c11888a7f5b02a20159340
  end

end
