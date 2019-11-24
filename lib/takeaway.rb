require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.display_menu
  end

end
