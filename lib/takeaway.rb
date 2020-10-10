require_relative 'menu'
class Takeaway 
  attr_reader :menu
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.view_dishes
  end
end
