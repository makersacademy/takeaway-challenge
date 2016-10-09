require_relative 'menu'

class Order

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def read_menu
    @menu.print_menu
  end

end
