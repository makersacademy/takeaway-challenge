class DishSelection

  attr_reader :order,
              :food_menu

  def initialize
    @food_menu = {
      1 => [:dish_1, 5],
      2 => [:dish_2, 4],
      }

      @order = []
  end

  def print_options_menu
    show_food_menu
    puts "Please type the numbers of the dishes you would to add to your order"
    puts "seperate the numbers with spaces, and press enter when finished"
    puts "eg. 1 2 3 4"
    get_selection
  end

  def get_selection
    select_dish(STDIN.gets.chomp.split)
  end

  def show_food_menu
    puts @food_menu
  end

  def select_dish(selection)
    selection.each do |x|
      @order << @food_menu[x.to_i]
    end
  end

end
