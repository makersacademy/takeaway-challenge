class Takeaway
  def initialize(menu:)
    @menu = menu   
  end  
  def display_menu
    menu.display
  end
  
  private

  attr_reader :menu 
end