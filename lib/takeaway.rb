require './lib/menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.display_menu
  end

end
