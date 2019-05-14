require_relative 'menu'

class Takeaway
  
  def view_menu
    @menu = Menu.new
    @menu.view_all
  end

end
