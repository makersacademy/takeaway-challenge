require "./lib/menu"

class User
  attr_reader :order

  def initialize 
    @order = nil 
  end 

  def request_full_menu(menu)
    menu = Menu.new 
      menu.full_menu 
  end 

  def new_order(unicorn)
    @order = unicorn
  end  
    


end 