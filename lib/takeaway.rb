class Takeaway

  attr_accessor :order ,:total

  def initialize
    @order = {}
    @total = 0
  end


  def list_menu
   {
      rice: 2,
      beef: 3,
      pizza: 3.5,
      beer: 2
    }
  end

  def make_order
    puts list_menu
    loop do
      puts " Select your order"
      item = gets.chomp
      if item == "end"
        break
      else
        if list_menu.key?(item.to_sym)
          puts "How many of that items?"
          numbers = gets.chomp.to_i
          @order[item] = numbers
        else
          puts "Select something from menu"
          puts list_menu
        end
      end
    end
    total_counter
    # chek items, check the price in list menu * quantity
    # save in total variable
  end

def total_counter
  @order.each { |key, value|  @total += list_menu[key.to_sym] * value }
end

end

# ask for a order  DONE !!!!
# Store input       DONE !!!
# If anserw = End , close the order  DONE !!!

# Check if item is in the menu
# Ask of quantity of items needs
# Store input
# Collect order - #{pizza: 3, rice: 2, beer: 1}
# Ask for another items if needed
# Total
