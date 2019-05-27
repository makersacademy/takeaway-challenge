require 'menu.rb'

class Takeaway
  def show_menu(menu = Menu.new)
    menu.see_menu
  end

end
