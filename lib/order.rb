require_relative 'menu'

class Order
  
  def display_menu
    Menu.new.list_of_dishes
  end
    

end