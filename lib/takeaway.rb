
class Takeaway
  require_relative './menu.rb'
  attr_reader :menu
  
  def initialize(menu = Menu.new)
    @menu = menu
  end
  
  def show_menu
    @menu.show_dishes
  end  

end
