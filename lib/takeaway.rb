class Takeaway
  def initialize(menu:)
    @menu = menu
  end
  
  def print_menu
    menu.menu_print
  end
  
  private
  
  attr_reader :menu
end