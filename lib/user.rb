require_relative 'menu'
class User

  def initialize (menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.menu
  end

end
