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

  def print_dishes(list)
    list.each_with_index do |dish, index|
      print "#{index + 1}.".center(4)
      puts "#{dish.name.ljust(25, ".")} £#{sprintf("%.2f", dish.price)}"
    end
  end
  

  def create_order
    print_dishes(dishes_list)
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
        @selected_dishes << dishes_list[input.to_i - 1]
        puts "Added to order: #{dishes_list[input.to_i - 1].name}"
        puts "Your order so far:"
        print_dishes(@selected_dishes)
        puts "Total cost so far: £#{sprintf("%.2f", prices_sum(@selected_dishes))}"
        
      end
    end
  end





end
