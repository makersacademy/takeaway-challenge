require_relative 'order'

class Menu
  attr_accessor :menu_items

  def initialize
    @menu_items = {
      "pizza" => 5.00,
      "chips" => 3.00,
      "burger" => 2.50
    }
  end

  def price(item)
    @menu_items[item]
  end

  def print_menu
    @menu_items.each do |item, price|
      puts "-----------------------------------"
      puts "--------- MeRo Resto --------------"
      puts "-----------------------------------"
      puts ".......... M E N U ................"
      puts "#{item}: £#{sprintf("%.2f", price)}"
    end
  end

end
