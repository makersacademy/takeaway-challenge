require_relative "menu"
require_relative "order"

class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.show
  end

  def add_to_order(item)
    fail "Item not on menu, please choose something else" unless @menu.dishes.map{ |dish| dish.name }.include?(item)
    @menu.dishes.each { |dish| order.add(dish) if dish.name == item }
  end



end
