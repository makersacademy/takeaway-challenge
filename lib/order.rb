class Order

  def initialize
    @food_order = []
  end

  def show_food_order
    @food_order.dup
  end

  def add_food(food, amount)
    @selected_menu.select { |name| :name = food }
  end

  def pull_food(name)
  end

end
