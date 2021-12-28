require 'menu'

class Takeaway

  attr_reader :menu
  def initialize(menu)
    @menu = menu
  end

  def display_menu
    puts @menu.print_menu
  end

end
