require_relative 'waiter'

class TakeAway

  def initialize(waiter = Waiter.new)
    @waiter = waiter
  end

  def show_menu(menu= {"Soup" => 2, "Oreo ice cream" => 1.50 , "Pierogi" => 5}
)
    line_width = 40
    puts "Menu".center(line_width)
    menu.each {|meal,price| puts meal.ljust(line_width/2) + ("£"+price.to_s).rjust(line_width/2)}
    @waiter.take_order(menu)
  end

  private

  attr_reader :waiter

end

