require 'menu'

class Takeaway

  def initialize(menu_type: Menu)
    @menu = menu_type.new
  end

  def display_menu
    @menu.display_menu
  end 


end
