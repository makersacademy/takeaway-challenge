require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize
    welcome
  end

  def welcome
    puts "Welcome to the Thai Cottage".center(500)
  end

  def view_menu
    create_menu
    puts "=======Starters========".center(500)
    @menu.print_starters
    puts "=======Main Courses=======".center(500)
    @menu.print_main_courses
  end

private

  def create_menu
    @menu = Menu.new
  end

end
