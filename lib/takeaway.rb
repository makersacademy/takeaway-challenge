require_relative 'menu'
class Takeaway
  attr_reader :menu

  def see_menu(menu = Menu.new)
    menu.show_menu
  end

end
