# require_relative './dish.rb'
require 'csv'

class Order
  attr_reader :available_dishes, :view_dishes, :selected_dishes, :order_total

  def initialize
    @available_dishes = []
    @selected_dishes = []
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
    puts "To proceed to your total, please press 'Enter' twice" "\n\n"
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
    #TODO This is ugly and I would love to find another/better way to get the price to be total-able
    sum = []
    sum = @selected_dishes.map{|price| price[:price]}
    a_total = sum.map!(&:to_f)
    total = a_total.sum
    @order_total = sprintf ('%.2f'), total
  end

  def show_order
    puts "Please confirm the following is correct before placing your order" "\n\n"
    @selected_dishes.each do |menu|
      puts "Item  #{menu[:item_number]}: #{menu[:dish]}  Price: £ #{menu[:price]}"
    end
    puts "Your total is £ #{order_sum}" "\n\n"
    order_options
    return order_sum
  end

  def order_options
    print_menu
    process(STDIN.gets.chomp)
  end

  def process(selection)
    # 3. options to re-select items, submit order, or cancel
    case selection
    when "1"
      submit_order
    when "2"
      @selected_dishes = []
      select_items
    when "3"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end

  def print_menu
    # print the menu and ask the user what to do
    puts "Please select an option"
    puts "1. Submit order"
    puts "2. Re-select dishes to order"
    puts "3. Cancel and leave"
  end

  def submit_order
    puts 'Order has been submitted, you will receive a text confirmation shortly'
    exit
  end

  #And end process that puts all the pieces into running order would be a good implementation, however, for this
  # project, if I do so, my testing coverage goes down to 73%
  #
  # def process_order
  #   select_items
  #   show_order
  #   order_options
  # end
end








