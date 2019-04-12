require_relative 'takeout_menu'

class Takeout

  def show_menu
    menu = TakeoutMenu.new
    menu.menu_list
  end
  
end
