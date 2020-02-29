require_relative 'menu'
require_relative 'order'

class Restaurant
  def initialize
    @menu = Menu.new
  end

  def see_menu
    @menu.print_menu
  end
end
