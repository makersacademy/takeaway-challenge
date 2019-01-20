require_relative 'menu'
require_relative 'twilio'

class Takeaway

  attr_reader :menu, :new_order_list, :total_order

  def initialize(menu = Menu.new)
    @menu = menu
    @new_order_list = Array.new
    @total_cost = 0
  end

  def show_menu
    @menu
  end

  def place_order(quantity, dish_wanted)
    @new_order_list.push({ quantity => dish_wanted })
    update_total_cost(quantity, dish_wanted)
  end

  def update_total_cost(quantity, dish_wanted)
    sprintf('%.2f', (@total_cost += (quantity * @menu.menu[dish_wanted]))).to_f
  end

  def complete_order(estimate_total)
    raise 'Total incorrect' if estimate_total != @total_cost
    delivery
  end

  def delivery
    Twilio.send_confirmation
    @new_order_list.clear
    @total_cost = 0
    return 'SMS confirmation sent'
  end
end
