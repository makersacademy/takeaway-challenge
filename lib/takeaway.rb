require './lib/menu'

class Takeaway

  def initialize(menu = Menu.new) # Menu class
    @menu = menu # menu object
  end

  def view_menu
    @menu.display_menu
  end

end
