require_relative 'menu'

class Order
  attr_reader :menu
  
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display_menu
    @menu.list_of_dishes
  end
    

end