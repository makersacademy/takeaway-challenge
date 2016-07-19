require_relative 'menu'
require_relative 'order'
require_relative 'calculate_bill'


class Restaurant

  attr_reader :menu, :order, :customer_order, :bill, :total_value

  def initialize
    welcome
    @menu = Menu.new
    @total_value = 0
  end

  def welcome
    puts "Welcome to the Thai Cottage"
  end

  def view_menu
    puts "=======Starters========".center(500)
    @menu.print_starters
    puts "=======Main Courses=======".center(500)
    @menu.print_main_courses
  end

  def place_order
    create_order
    @customer_order = @order.customer_order
  end



private

  def create_order
    @order = Order.new
  end

  def creates_calculate_bill
    @bill = CalculateBill.new(@customer_order)
  end
end
