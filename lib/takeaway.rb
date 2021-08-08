require_relative 'menu'
require_relative 'order'

class Takeaway

  def display_menu
    Menu.new.list
  end 

  def new_order
    Order.new
  end 

end 
