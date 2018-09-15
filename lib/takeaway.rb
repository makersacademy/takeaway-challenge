require './lib/menu'

class Takeaway

  def initialize(menu = Menu) # Menu class
    @menu = menu.new # menu object
  end

  def view_menu
    @menu.dishes
  end

end
