require_relative 'menu'

class Customer

  def see_menu(filename = 'menu.csv')
    menu = Menu.new(filename)
    menu.print_menu
  end

end
