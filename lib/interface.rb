require 'csv'
require_relative 'order'

class Interface

  def initialize
    @menu = CSV.read('menu.csv')
  end

  # Shows dishes, read from a csv file
  def show_dishes
    @menu.each_with_index do |item, index|
      itemname = item[0]
      price = item[1]
      puts "#{index + 1}. #{itemname} - £#{price}"
    end
  end

  # take in the selection from a user and store it as an array
  def selection_input
    selection = []
    puts "Enter q to end input"
    loop do
      print "Enter the number of your selection: "
      input = gets.chomp
      break if input == 'q'
      selection << input
    end
    selection
  end

  def generate_order(input)
    order = []
    input.each do |number|
      order << @menu[number.to_i - 1]
    end
    @selection = order
    order
  end

  def order_add(order)
    order.add(generate_order(selection_input))
  end

end
