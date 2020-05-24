class Takeaway
  
  def initialize(menu:)
    @menu = menu
  end

  def show_menu
   menu.read
  end
 
  private

  attr_reader :menu

end
