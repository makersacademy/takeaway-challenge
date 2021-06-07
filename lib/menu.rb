class Menu
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end
  
  def show_menu 
    @menu
  end
end
