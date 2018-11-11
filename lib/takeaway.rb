require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Takeaway

  attr_reader :ordered_dishes

  def show_menu
    menu = Menu.new
    menu.print
  end

  def place(order)
    fail "Can't place the order: no dish selected" if order.nothing_selected?
    @ordered_dishes = order.dishes
    text = Text.new
    text.send
    order.total_cost
  end

end
