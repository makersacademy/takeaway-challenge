require_relative "menu"
class Restaurant

  attr_reader :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new    
  end 
end 
