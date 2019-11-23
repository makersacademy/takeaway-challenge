require_relative 'menu'

# attr_reader :menu

class Takeaway 

  def initialize(menu = Menu.new)
    @menu = menu
    
  end


  def view_menu
    @menu.display
  end

end