require_relative 'message'
require_relative 'menu'

class Takeaway

  attr_accessor :dishes, :basket, :total, :message, :menu

  def initialize(message = Message.new, menu = Menu.new)

    @menu = menu
    @message = message
    @basket = []
    @total = []
  end

  def options
    puts "1. See menu."
    puts "2. Add dishes to order."
    puts "3. View basket."
    puts "4. Checkout"
  end
  
  def interactive_input
    loop do
      options
      process(STDIN.gets.chomp)
    end
  end

  def process(selection)
    case selection
      when "1"
        print_menu
      when "2"
        add_to_basket
      when "3"
        order_total
      when "4"
        send_msg
        exit
      else
        puts "Please enter a valid option."
    end
  end    

def print_menu
  @menu.print
end

  
  def add_to_basket
    puts "Enter the dish number you want to add to your order."
    puts "To finish, hit return twice:"
    n = STDIN.gets.chomp
    while !n.empty? do
      puts "Enter quantity:"
      quantity = STDIN.gets.chomp.to_i
      @menu.dishes.each_with_index do |(dish, price), idx|
        if n.to_i > @menu.dishes.length
          puts "Error. Please enter a valid dish."
          break
        else 
          if (n.to_i-1) == idx
            @basket.push("#{dish} x #{quantity.to_s}: £#{price*quantity}")
            puts "#{quantity} #{dish}(s) added to your basket"
            total.push(price*quantity)
            break
          end
        end
      end
      puts "Enter the dish number you want to add to your order:"
      n = STDIN.gets.chomp
    end
  end 

  def order_total
    puts basket
    puts "Your order total is: £#{total.inject(:+)}"
  end

  def send_msg
    @message.send
  end
end
