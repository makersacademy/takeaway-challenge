class Takeaway

  require 'ap'

  def initialize
    @menu = {
      1 => "Chicken Chow Mein, £6.75",
      2 => "Pork Rendang, £5.50",
    }

    @prices = {
      1 => 6.75,
      2 => 5.50
    }

  end

  def interface
    loop do
      puts "*** Welcome to the takeaway ***"
      puts "Select from the following options:"
      puts "To view the menu, press 1"
      puts "To make an order, press 2"
      puts "To exit, press 3"

      selection = gets.chomp

      case selection
      when "1"
        print_menu
      when "2"
        order
      when "3"
        puts "Thank you, goodbye!"
        exit
      else
        "Please try again"
      end
    end
  end

def print_menu
  ap @menu
end

def order
  orders_array = []
  order = []
  running_total = 0
  puts "Enter the number of the dish you'd like to order"
  loop do
  order << gets.chomp.to_i
  puts "How many would you like?"
  order << gets.chomp
  order_cost = order[1].to_f * @prices[order[0]].to_f
  # puts @priceorder[0]]
  # puts order_cost
  running_total += order_cost

  orders_array << order
  puts "That's #{order[1]} x #{@menu[order[0]]} costing £#{order_cost.round(2)}"
  puts "Enter the number the next dish you'd like to order, if you're finished, press 'X'"

  # Enter number of dish you'd like to Order
  # Enter the Quantity of dishes
  # Exit and confirm
  # Change Order
  # Start again
  # Exit
end

def confirm
  # Review order and total
  # confirm or cancel
end

def notify
  # take telephone number
  # send confirmation message
end

end

takeaway = Takeaway.new

takeaway.interface
