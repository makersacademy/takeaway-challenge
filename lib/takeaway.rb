require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
  end

  def view_menu
    @menu.print_menu
  end
end
