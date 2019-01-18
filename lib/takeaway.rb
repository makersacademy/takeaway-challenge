require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu)
    @menu = menu.new
  end

  def print_menu
    @menu.print_menu
  end

end
