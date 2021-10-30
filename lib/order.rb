# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes, :view_dishes, :selected_dishes

  def initialize
    @available_dishes = []
    @selected_dishes = []
  end

  def load_dishes
    CSV.foreach("available_dishes.csv") do |line|
       dish, price = line
       @available_dishes << { dish: dish, price: price.to_f }
    end
  end

  def view_menu
    puts "-------Available Dishes-------"
      @available_dishes.each do |menu|
      puts "#{menu[:dish]}  Price: £ #{menu[:price]}"
    end
  end

  def select_items
    puts "Please select your desired dishes based on Item number from the menu below"
    puts "To proceed to your total, please press 'Enter' twice"
    puts "-------Available Dishes-------"
    @available_dishes.each do |menu|
      # TODO: fix this so that it prints the selection item number
      puts "Item  #{menu[:selection]}: #{menu[:dish]}  Price: £ #{menu[:price]}"

    end
    selection = STDIN.gets.chomp
    while !selection.empty? do
      @selected_dishes << {selection: selection.to_i}
      puts "you selected #{@selected_dishes}"
      selection = STDIN.gets.chomp
    end
    return @selected_dishes
  end
end


