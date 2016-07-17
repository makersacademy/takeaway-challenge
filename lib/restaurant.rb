require_relative 'menu'

class Restaurant

  attr_reader :menu

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
