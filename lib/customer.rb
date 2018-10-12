require_relative 'menu'

class Customer

  def check_menu(menu)
    menu.list_dishes if menu.is_a?(Menu) # Uses the menu.list funtion if menu
  end
end
