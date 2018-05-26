require_relative 'menu'

class Cafe

  def display(menu = Menu.new)
    menu.show_menu
  end

end
