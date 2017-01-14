require_relative "menu.rb"
require_relative "dish.rb"
require_relative "menu_lister.rb"
require_relative "order.rb"

class Takeaway

  attr_reader :menu

  def initialize(menu, lister_module=MenuLister, order_class=Order)
    @menu = menu
    @lister = lister_module
    @order_class = order_class
  end

  def show_menu
    print @lister.list(@menu)
  end

  def place_order

  end

  def new_order
    @order_class.new
  end

end
