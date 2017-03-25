class Takeaway


  def initialize(menu:)
    @menu = menu
  end

  def print_menu
    menu.show_menu
  end

  private
  attr_reader :menu

end
