
class TakeAway
  attr_reader :order
  def initialize
    @order = {}
  end

  def show_menu
    filename = "lib/menu.txt"
    File.open filename do |f|
      f.each { |line| puts line }
    end
  end

  def enter_order
    puts "Enter the dish number and the quantity when ask"
    loop do
      puts "Enter a dish number or 99 to end ordering"
      dish_number = gets.chomp
      break if dish_number.to_i == 99
      if dish_number.to_i <= 0 or dish_number.to_i > 19
        puts "please enter a valid dish number"
        next
      end
      puts "Enter quantity"
      quantity = gets.chomp
      @order[dish_number.to_i] = quantity.to_i
    end
  #  calculate_order
  end

  def calculate_order
    puts "Please enter your estimated total"
    @order_total = gets.chomp
  end


end
