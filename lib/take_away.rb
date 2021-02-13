require 'menu'

class TakeAway
  
  def initialize(menu = Menu.new)
    @menu = menu
  end 

  def read_menu()
    @menu.dishes
  end 

end 
