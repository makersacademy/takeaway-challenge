require_relative "menu"
class Restaurant

  attr_reader :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new    
  end

  def print_menu
    #prints menu  
    puts "Dishes with prices"
  end
end 
