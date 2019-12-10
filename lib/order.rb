require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @customer_order = []
    @menu = menu
  end

  def menu_list
    @menu.menu_list
  end

  def view_order
    @customer_order
  end

  def add_dish(dish, quantity = 1)
    if @menu.dish_on_menu?(dish)
      add_dish_to_order(dish, quantity)
    else
      "Sorry, that's not a dish on the menu"
    end
  end

  def calculate_total
    add_each_order
  end

  private

  def add_dish_to_order(dish, quantity)
    price = cost_of_dish_in_quantity(dish, quantity)
    @customer_order.push([dish, quantity, price])
  end

  def cost_of_dish_in_quantity(dish, quantity)
    menu_list[dish.to_sym] * quantity
  end

  def add_each_order
    total = 0
    order = view_order
    order.each do |dish|
      total += dish[2]
    end
    total
  end

end
