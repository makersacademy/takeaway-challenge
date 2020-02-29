require_relative 'menu'

class Restaurant
  def initialize
    @menu = Menu.new
  end

  def see_menu
    @menu.print_menu
  end
end
