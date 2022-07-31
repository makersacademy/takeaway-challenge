require_relative 'menu'

class InterMenu

  def initialize
    display_options
    @customer_selection = gets.chomp.to_i
    selection
  end

  def selection
    case
      when @customer_selection == 1
      when @customer_selection == 2
      when @customer_selection == 3
      when @customer_selection == 4
      when @customer_selection == 5
      when @customer_selection == 5
    end
  end


private
def display_options
  puts "What are you looking to do?"
  puts "1. View the menu"
  puts "2. Order food"
  puts "3. Check your basket"
  puts "4. Calculate your total"
  puts "5. Order & recieve text"
  puts "6. Quit"
end
end
