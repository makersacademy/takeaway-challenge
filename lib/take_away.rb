 require_relative 'menu'
class TakeAway

attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    menu.printed_dishes
  end
  
end