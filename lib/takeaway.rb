require 'menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def get_menu(menu = @menu)
    menu.show_menu
  end
end
