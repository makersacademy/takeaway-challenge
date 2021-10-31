# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes, :view_dishes, :selected_dishes, :order_total

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
    puts "------------Available Dishes------------"
      @available_dishes.each do |menu|
      puts "Item # #{menu[:item_number]} #{menu[:dish]}  Price: £ #{menu[:price]}"
    end
  end

  def select_items
    puts "Please select your desired dishes based on Item number from the menu below"
    puts "To proceed to your total, please press 'Enter' twice"
    puts "------------Available Dishes------------"
    @available_dishes.each do |menu|
      puts "Item  #{menu[:item_number]}: #{menu[:dish]}  Price: £ #{menu[:price]}"
      end
      selection = STDIN.gets.chomp
      while !selection.empty? do
        selection = selection.to_i
        @selected_dishes << @available_dishes[selection-1]
        selection = STDIN.gets.chomp
      end
  end

  def order_sum
    sum = []
    sum = @selected_dishes.map{|price| price[:price]}
    a_total = sum.map!(&:to_f)
    total = a_total.sum
    @order_total = sprintf ('%.2f'), total
    @order_total
  end

  def show_order
    puts "Please confirm the following is correct before placing your order" "\n\n"
    @selected_dishes.each do |menu|
      puts "Item  #{menu[:item_number]}: #{menu[:dish]}  Price: £ #{menu[:price]}"
    end
    puts "Your total is £ #{order_sum}"
    return order_sum
  end

end




