require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :ordered_dishes

  def show_menu
    menu = Menu.new
    menu.print
  end

  def place(order)
    @ordered_dishes = order.dishes
    order.total_cost
  end

end
