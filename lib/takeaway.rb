require 'menu'

class Takeaway

  attr_reader :menu, :dishes

  def initialize
    @menu = menu
    @dishes = {}
  end

  def show_menu
    Menu::DISHES
  end

end
