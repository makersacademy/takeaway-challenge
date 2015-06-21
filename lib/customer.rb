require_relative 'menu'
class Customer

  attr_reader :menu
  
  def initialize
    @menu = Menu.new
  end

  def view_dishes
    menu.show_dishes
  end

end