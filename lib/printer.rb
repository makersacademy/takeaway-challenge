require 'takeaway'

class Printer

  attr_reader :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
  end

  def interactive_menu
    print '1. See Menu'
  end

  def print_menu
    restaurant.menu.items.each_with_index do |item, index|
        puts "#{index + 1}. #{item.name}: £#{item.price}"
    end

  end
end
