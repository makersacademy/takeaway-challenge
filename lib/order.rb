# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes, :view_dishes, :selected_dishes, :entire_menu

  def initialize
    @available_dishes = []
    @selected_dishes = []
    @entire_menu = []
  end

  def load_dishes
    CSV.foreach("available_dishes.csv") do |line|
       dish, price, item_number = line
       @available_dishes << { dish: dish, price: price, item_number: item_number }
    end
  end

  def view_menu
    puts "-------Available Dishes-------"
      @available_dishes.each do |menu|
      puts "Item # #{menu[:item_number]} #{menu[:dish]}  Price: £ #{menu[:price]}"
    end
  end

  def select_items
    puts "Please select your desired dishes based on Item number from the menu below"
    puts "To proceed to your total, please press 'Enter' twice"
    puts "-----------Available Dishes-----------"
    @available_dishes.each do |menu|
      # TODO: fix this so that it prints the selection item number
      puts "Item  #{menu[:item_number]}: #{menu[:dish]}  Price: £ #{menu[:price]}"
      end
      selection = STDIN.gets.chomp
      while !selection.empty? do
        @selected_dishes << { selection: selection }#, menu:[:dish], price:[:price]}
        selection = STDIN.gets.chomp
      end

  end
end


