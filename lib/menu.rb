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
    puts "-----------------------------------"
    puts "        _....._
              _.:`.--|--.`:._
            .: .'\o  | o /'. '.
          // '.  \ o|  /  o '.\
          //'._o'. \ |o/ o_.-'o\\
          || o '-.'.\|/.-' o   ||
          ||--o--o-->| "
    puts "--------- MeRo Resto --------------"
    puts "-----------------------------------"
    puts ".......... M E N U ................"
    @menu_items.each do |item, price|
      puts "#{item}: £#{sprintf("%.2f", price)}"
    end
    puts "-----------------------------------"
    puts "-----------------------------------"
  end

end
