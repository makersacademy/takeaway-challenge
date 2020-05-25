require_relative 'order'
require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
  end

  def show_menu
    @menu.print_menu
  end

end
