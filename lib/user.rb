require_relative 'dish'
require_relative 'menu'

class User

  def initialize(menu = Menu.new)
    @menu = menu
  end
  
  def list_dishes
    menu
  end
  
  def order(dish)
    dish
  end
  
  private
  
  attr_reader :menu

end