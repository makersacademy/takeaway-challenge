require_relative 'twilio'
require_relative 'menu'

class Order

  attr_reader :menu, :new_order_list, :total_cost

  def initialize(menu = Menu.new, confirmation_app = SMS.new)
    @menu = menu
    @total_cost = 0
    @new_order_list = Array.new
    @confirmation_app = confirmation_app
  end

  def place(dish_wanted, quantity)
    @new_order_list.push({ quantity => dish_wanted })
    update_total_cost(dish_wanted, quantity)
  end

  def update_total_cost(dish_wanted, quantity)
    (@total_cost += (quantity * find_price(dish_wanted))).round(2)
  end

  def find_price(dish_wanted)
    @menu.menu_list.map { |dish|
        dish.price if dish.dish_name == dish_wanted
      }.compact[0]
  end

  def complete_order(estimate_total)
    raise 'Total incorrect' if estimate_total != @total_cost
    delivery
    clear_order
  end

  def delivery
    @confirmation_app.send_confirmation
    return 'SMS confirmation sent'
  end

  def clear_order
    @new_order_list.clear
    @total_cost = 0
  end

end
