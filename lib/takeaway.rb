require_relative "menu"
require_relative "order"
attr_reader = :menu

# TODO: order =Order.new IN INITIALIZE
class Takeaway
  def initiallize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end 

  def check_menu
  @menu.menu_list
  end


end

