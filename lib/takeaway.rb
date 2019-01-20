require_relative 'menu'

class Takeaway

  attr_reader :menu, :new_order_list, :total_order

  def initialize(menu = Menu.new)
    @menu = menu
    @new_order_list = Array.new
    @total_order = 0
  end

  def show_menu
    @menu
  end

  def place_order(quantity, dish_wanted)
    @new_order_list.push({quantity => dish_wanted})
    update_total_order(quantity, dish_wanted)
  end

  def update_total_order(quantity, dish_wanted)
    sprintf('%.2f', (@total_order += (quantity * @menu.menu[dish_wanted]))).to_f
  end

  def complete_order(estimate_total)
    raise 'Total incorrect' if estimate_total != @total_order
    'Order confirmed'
  end
end
