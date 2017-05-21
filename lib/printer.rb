require 'takeaway'

class Printer

  attr_reader :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
  end

  def interactive_menu
    puts '1. See Menu'
    puts '2. Choose Item'
  end

  def print_menu
    restaurant.menu.items.each_with_index do |item, index|
        puts "#{index + 1}. #{item.name}: £#{item.price}"
    end
  end

  def input_item_selection
    puts "Please input the item number of your selection"
  end

  def input_quantity
    puts "Please enter the quantity"
  end


end
