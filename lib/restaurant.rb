require_relative 'menu'

class Restaurant

  attr_reader :menu, :order

  def initialize
    welcome
  end

  def welcome
    puts "Welcome to the Thai Cottage"
  end

  def view_menu
    create_menu
    puts "=======Starters========".center(500)
    @menu.print_starters
    puts "=======Main Courses=======".center(500)
    @menu.print_main_courses
  end

  def place_order
    create_order
  end

private

  def create_menu
    @menu = Menu.new
  end

  def create_order
    @order = Order.new
  end
end
