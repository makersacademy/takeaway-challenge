require_relative 'menu'
require_relative 'order'
# https://wireframe.cc/hNUOJz << Domain model

class Takeaway

  def display_menu
    Menu.new.list
  end 

  def new_order
    Order.new
  end 

end 
