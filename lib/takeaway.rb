require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize
    @menu = menu
  end

  def view_menu(menu)
    print menu
  end
end
