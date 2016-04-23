require_relative 'dish'

class User

  def initialize(menu)
    @menu = menu
  end
  
  def list_dishes
    menu
  end
  
  private
  
  attr_reader :menu

end