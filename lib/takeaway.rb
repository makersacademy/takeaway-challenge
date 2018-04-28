require 'menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu.display_menu
  end

end
