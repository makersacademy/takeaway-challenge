require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu

  def initialize
    puts "======Welcome to the Thai Cottage========".center(500)
    @menu = Menu.new
  end

  def view_menu
    puts "=========Starters=========".center(500)
    @menu.print_starters
    puts "=======Main Courses=======".center(500)
    @menu.print_main_courses
    puts "==========================".center(500)
  end

  def place_order
    Order.new
  end

end
