require_relative 'menu'

class LazyPizza

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end


  def show_menu
    @menu.format_menu
  end

end