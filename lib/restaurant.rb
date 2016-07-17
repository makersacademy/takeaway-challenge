require_relative 'menu'

class Restaurant
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.print_menu
  end

  def order_item(item)
    raise "#{item} is not on the menu" unless @menu.menu_items.has_key?(item)
    @menu.menu_items.select{ |k, v| k == item }
  end
end
