require_relative 'menu_view'
require_relative 'menu_factory'
require_relative 'order_factory'
require_relative 'order_view'

class Takeaway

  def initialize(menu = MenuFactory.new.create_menu('./res/dishes.json'),
      menu_view_class = MenuView, order_factory_class = OrderFactory,
      order_view_class = OrderView)
    @menu = menu
    @menu_view_class = menu_view_class
    @order_factory_class = order_factory_class
    @order_view_class = order_view_class
    @current_order = nil
  end

  def display_menu
    puts @menu_view_class.new(@menu).display
  end

  def place_order(items_list)
    @current_order = @order_factory_class.new(@menu).create_order(items_list)
  end

  def display_order
    puts @order_view_class.new(@current_order).display
  end

end
