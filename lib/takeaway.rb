require 'menu'

class Takeaway

attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def print_menu
    menu.menu_list
  end

end
