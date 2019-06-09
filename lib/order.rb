require 'CSV'

class Order
  LINE_WIDTH = 40

  def show_menu
    print_header
    print_menu
  end

  private

  def print_header
    puts "Menu".center(LINE_WIDTH)
    puts "------".center(LINE_WIDTH)
  end

  def print_menu
    CSV.foreach("menu.csv") do |line|
      dish, price = line
      puts "#{dish.capitalize} £#{price}".center(LINE_WIDTH)
    end
  end
end
