require 'menu.rb'
class Takeaway
  attr_reader :menu
def initialize(menu = Menu.new)
  @menu = menu
  @new_order = new_order

end
  def print_menu
    menu.print
  end
  def place_order
    new_order
  end
end
