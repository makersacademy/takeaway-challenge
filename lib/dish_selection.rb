class DishSelection

  attr_reader :order,
              :food_menu

  def initialize
    @food_menu = {
      1 => ["ISKENDER KEBAB", 9.50],
      2 => ["ALI NAZIK", 9.50],
      3 => ["HALEP KEBAB", 9.50],
      4 => ["YOGURTLU LAMB SHISH", 9.50],
      5 => ["YOGURTLU ADANA", 9.50],
      6 => ["YOGURTLU CHICKEN SHISH", 9.50],
      7 => ["LAMB SARMA BEYTI", 10.00],
      8 => ["CHICKEN SARMA BEYTI", 10.00],
      9 => ["AUBERGINE KEBAB", 9.00],
      }

      @order = []
  end

  def print_options_menu
    show_food_menu
    puts "\nPlease type the numbers of the dishes you would to add to your order"
    puts "seperate the numbers with spaces, and press enter when finished"
    puts "eg. 1 2 3 4"
    get_selection
  end

  def get_selection
    select_dish(STDIN.gets.chomp.split)
  end

  def show_food_menu
    @food_menu.each {|key, value| puts " #{key} - #{value[0]}....£#{value[1]}0" }
  end

  def select_dish(selection)
    selection.each do |x|
      @order << @food_menu[x.to_i]
    end
  end

end
