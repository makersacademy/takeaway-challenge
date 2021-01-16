require_relative "dish"
require_relative "order"
require "csv"

class Menu

  attr_reader :dishes_list

  def initialize
    @dishes_list = []
  end

  def load_menu(file)
    CSV.foreach(file) do |line|
      dish_name, dish_price = line
      dishes_list << Dish.new(dish_name, dish_price.to_i)
    end

  end

  def add_dish(dish)
    @dishes_list << dish
  end

  def print_dishes
    dishes_list.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish.name.ljust(25, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end

  def create_order
    print_dishes
    @selected_dishes = []
    get_user_choices
    Order.new(@selected_dishes)
  end

  def get_user_choices
    puts "What would you like to order?"
    puts "To finish, just hit return twice."
    loop do
      puts "Please select dish by number."
      input = gets.chomp
      if input.empty?
        break
      elsif input.to_i <= dishes_list.length
        puts "Added to order: #{dishes_list[input.to_i - 1].name}"
        @selected_dishes << dishes_list[input.to_i - 1]
      end
    end
  end

end
