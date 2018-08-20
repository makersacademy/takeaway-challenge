require_relative "show_menu"

class Order

  attr_reader :choice_array

  def initialize(show_menu = ShowMenu.new)
    @choice_array = []
  end

  def take_order
    puts "Welcome to Take Away!"
    puts "Please select the dishes and quantity of each (i.e. \"Chicken Tikka Masala, 1\")"
    puts "Once you've chosen all your desired dishes, end 'exit'"
    while true do
      choice = STDIN.gets.chomp
        if choice == 'exit'
          break
        end
        @choice_array << choice
    end

    def display_order
      puts @choice_array
    end
  end

end
