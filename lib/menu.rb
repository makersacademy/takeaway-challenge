# Stores and returns menu items and their prices

class Menu
  attr_reader :items

  def initialize
    @items = { pizza: 10.00, burger: 8.00, fried_chicken: 8.50 }
  end

  def display
    puts "Our current menu:"
    @items.each { |item, price| puts "#{item} - #{price}" }
  end
end
