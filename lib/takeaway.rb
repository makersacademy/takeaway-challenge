class Takeaway
  def initialize(menu:)
    @menu = menu
  end 

  def show_menu
    @menu.display
  end 
end