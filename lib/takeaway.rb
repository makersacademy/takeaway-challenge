require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
  end 

  def display_menu
    @menu.show_menu
  end

end
