=begin
require 'menu' # for some reason this is raising a LoadError


menu = Menu.new(dish, price)
p menu("Tonkotsu", 10)



class Menu

  attr_reader :menu_list, :menu_select

  def initialize
    @menu_list = { ramennoodles: 5, chicken: 4, veggies: 3, drink: 1 }
    @menu_select = []
  end

  def list_meals
    puts 'Please look at the menu and choose your dish(es)'
    return @menu_list
  end

  def interactive_menu
    puts 'Please enter the meal you want'
    meal = gets.strip
      raise 'You have not enetered anything' if meal.empty?

    puts 'How many would you like?'
    quantity = gets.to_i

    while !meal.empty? do
      @menu_select << { meal: meal, quantity: quantity }
        if @menu_select.count == 1
          puts "You have selected #{@menu_select} meal"
        else
          puts "You have selected #{@menu_select} meal"
        end

        puts 'Please type in another meal. Or press enter again to finish'
        meal = gets.strip
          if !meal.empty?
            puts 'How many would you like?'
              quantity = gets.strip
          else
          end
    end
  end
end


menu = Menu.new
p menu.list_meals
p menu.interactive_menu
=end
