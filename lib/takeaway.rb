#Understands the process of ordering a takeawy

require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def get_menu
    @menu.print_menu
  end

  def select_food

  end

end
