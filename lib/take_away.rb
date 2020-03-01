class Takeaway

  attr_accessor :menu

  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.print
  end
end