require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    menu.print
  end

  private
  
  attr_reader :menu
 

end





