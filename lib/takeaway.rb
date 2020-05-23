require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def view_menu
    @menu.menu
  end
end
