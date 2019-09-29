require_relative 'menu'
#haddock: 7,
#cod: 6,
#scampi: 5,
#large_chips: 3,
#small_chips: 2

class Order
  def initialize(menu = Menu.new)
    @customer_order = []
    @menu = menu
  end

  def view_menu
    @menu.view_menu
  end

  def menu_list
    @menu.menu_list
  end

  def view_order
    @customer_order
  end

  def add_dish(dish, quantity = 1)
    if dish_on_menu?(dish) == true
      add_dish_to_order(dish, quantity)
    else
      "Sorry, that's not a dish on the menu"
    end
  end

  private

  def dish_on_menu?(dish)
    menu_list.any? { |dish_key, price|  dish_key == dish.to_sym }
  end

  def add_dish_to_order(dish, quantity)
    price = cost_of_dish_in_quantity(dish, quantity)
    @customer_order.push([dish, quantity, price])
  end

  def cost_of_dish_in_quantity(dish, quantity)
    menu_list[dish.to_sym] * quantity
  end

end
