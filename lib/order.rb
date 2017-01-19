class Order

attr_reader :basket, :placed_order

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add(dish, quantity)
    raise "Invalid order" if invalid_order(dish)
    @basket << (@placed_order = [dish, quantity, calc_cost_per_dish(dish, quantity)])
    print_order
  end

  private

  def invalid_order(dish)
    !Menu::MENU.has_key?(dish)
  end

  def print_order
    dish, quantity = placed_order[0], placed_order[1]
    "#{quantity}x #{dish}(s) added to your basket"
  end

  def calc_cost_per_dish(dish, quantity)
    @menu.get_dish_price(dish)*quantity*100
  end

end
