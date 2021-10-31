# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes, :view_dishes, :selected_dishes, :ordered_items

  def initialize
    @available_dishes = []
    @selected_dishes = []
    @ordered_items = []
    load_dishes
  end

  def load_dishes
    CSV.foreach("available_dishes.csv") do |line|
       dish, price, item_number = line
       #"{imported_menu = []}"
       @available_dishes << { item_number: item_number, dish: dish, price: price }

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
      puts "Item  #{menu[:item_number]}: #{menu[:dish]}  Price: £ #{menu[:price]}"
      end
      selection = STDIN.gets.chomp
      while !selection.empty? do
        selection = selection.to_i
        @selected_dishes << @available_dishes[selection-1]
        # select{
        #   |item| item[:item_number].include?(selection)}.map #{
        # #|item| item[:item_number], item[:dish], item[:price]}
        # @selected_dishes << { selection: selection }#, menu:[:dish], price:[:price]}
        selection = STDIN.gets.chomp
      end
  end

  def order_sum
    sum = []
    sum = @selected_dishes.map{|price| price[:price]}
    a_total = sum.map!(&:to_f)
    p total = a_total.sum
    p sprintf '%.2f', total
  end
  # def show_order
  #   puts "Please confirm the following is correct before placing your order" "\n\n"
  #   puts @selected_dishes
  #
  # end

end




