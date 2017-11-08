require './lib/takeaway.rb'

class Display
  def initialize(takeaway = Takeaway.new)
    @takeaway = takeaway
  end

  puts "Welcome to the takeaway restaurant!"
  puts "Please go right ahead and make your selection"
  puts "Select 1 to view our menu"
  puts "Select 2 to order a dish"
  puts "Select 3 to view your total"
  puts "Select 4 to check out and eat our delicious food"
  puts "Select 5 to exit"
  gets.chomp

  case select
    when 1
      @takeaway.menu.list
    when 2
      puts "Please type in what you would like to select"
      @takeaway.order(dish)
    when 3
      @takeaway.total
    when 4
      @takeaway.check_out
    when 5
      exit
    else
      puts "Please put in a correct digit"
  end
end
