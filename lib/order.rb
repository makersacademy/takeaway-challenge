require_relative 'menu.rb'

class Order

  attr_reader :start_program, :menu_class, :menu

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @start_program = ask_for_order


  end

  def ask_for_order
    @menu = @menu_class.new
    @menu.menu_load
    puts "To view the menu enter 'view menu' to make a order enter 'make order'"
    input = gets.chomp
    choice(input)
  end

  def choice(input)
    while input != "finish"
      if input == 'view menu'
        @menu.view_menu
        puts "'maker order' or type 'finish'"
        input = gets.chomp
      elsif input == 'make order'
        while input != "finish"
          puts "Please enter the name of the item you would like to order"
          puts "when you are done please type 'finish'"
          input = gets.chomp
          make_a_order(input)
        end
        break
      end
    end
  end

  def make_a_order(input)
    @menu.temp_dishes.each do |dish|
      if dish.name == input
        puts "How many would you like?"
        input = gets.chomp
        @menu.quantity_checker(input, dish)
      elsif dish == @menu.temp_dishes[-1]
        puts "There is no dish with that name"
      end
    end
  end

end
