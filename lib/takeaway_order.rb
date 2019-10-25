# The TakeawayOrder class
class TakeawayOrder
  attr_reader :list_of_dishes, :current_order_cost, :stored_menu

  def initialize(stored_menu)
    @list_of_dishes = {}
    @stored_menu = stored_menu
    @current_order_cost = 0
  end

  def select_takeaway_dish(dish_menu_number)
    takeaway_dish = stored_menu.takeaway_dishes[(dish_menu_number - 1)]
    return takeaway_dish
  end

  def add_takeaway_dish(dish_menu_number, amount_of_each_dish_ordered)
    list_of_dishes[select_takeaway_dish(dish_menu_number)] = amount_of_each_dish_ordered
  end

  def basket_total(total)
    @current_order_cost = total
  end
end
