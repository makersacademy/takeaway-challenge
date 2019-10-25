require 'menu'

class Restaurant
attr_reader :new_menu

  def initialize
    @new_menu = Menu.new
  end

  def view
   puts @new_menu.show
  end

  def start_order
    puts "Begin order, type 'Done' when you finish."
    puts "What do you want?"
    @dish_name = gets.chomp.to_s
    until @dish_name == "Done"
      puts "How many do you want?"
      @dish_quantity = gets.chomp.to_i
      @new_menu.add_dish(@dish_name.to_sym,@dish_quantity)
      puts "What do you want?"
      @dish_name = gets.chomp.to_s
    end
  end


end
