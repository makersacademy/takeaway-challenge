require_relative 'takeout_menu'

class Takeout

  def initialize
    @takeout_menu = TakeoutMenu.new
  end

  def show_menu
    @takeout_menu.menu_list
  end

  def select(food)
    raise "That item is not on the menu!" if !@takeout_menu.menu.include?(food)
  end

end
