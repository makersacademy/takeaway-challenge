require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.print_menu
  end

end
