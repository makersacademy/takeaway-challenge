require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize(dishes)
    @menu = Menu.new dishes
  end

  def display_menu
    puts @menu.print_dishes
  end
end
