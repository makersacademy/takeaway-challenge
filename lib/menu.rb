require './lib/order'

class Menu
  attr_reader :items

  def initialize
    @items = {
      "Margarita Pizza" => 8,
      "Hamburger" => 6,
      "Chips" => 2
    }
  end

  def display
    @items.each do |item, price|
      puts "#{item}, £#{price}"
    end
  end
end
