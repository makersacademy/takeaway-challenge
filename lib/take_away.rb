
class TakeAway
  attr_reader :order, :dish_hash
  def initialize
    @order = {}
    @dish_hash = {}
    #create_dish_hash
  end

  def show_menu
    # can be refactored to take menu.csv as input file
    filename = "lib/menu.txt"
    File.open filename do |f|
      f.each { |line| puts line }
    end
  end

  def enter_order
    # can be refactored to use one method with an
    # puts and a gets statement
    # and an abstracted method to use variables for
    # the message, the input variable and an validation
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
  end

  def create_dish_hash
    filename = "lib/menu"
    File.open filename do |f|
        f.each do |line|
          arr = line.split(",")
          dish_hash[arr[0].to_i] = [arr[1],arr[2].to_f]
        end

    end
  end

  def order_total

  end


end
