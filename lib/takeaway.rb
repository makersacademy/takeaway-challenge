require_relative 'menu'
class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def show_menu
    menu.display
  end

  private #-------------------------------
  attr_reader :menu
end
