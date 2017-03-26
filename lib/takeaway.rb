require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    menu.options
  end
end
