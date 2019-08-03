require 'order'

class Takeaway

  def initialize(menu_class = Menu)
    #dont forget to initialize the other classes here
    @menu_class = menu_class
  end

  def print_menu
    menu = @menu_class.new
    menu.print
  end

private

attr_reader :menu, :order
end
