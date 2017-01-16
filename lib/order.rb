class Order

attr_reader :basket, :placed_order

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(dish, quantity)
    @basket << (@placed_order = [dish, quantity, add_cost_per_dish(dish)])
    print_order
  end

  private

  def print_order
    dish, quantity = placed_order[0], placed_order[1]
    "#{quantity}x #{dish}(s) added to your basket"
  end

  def add_cost_per_dish(dish)
    @menu.get_dish_price(dish)
  end

end
