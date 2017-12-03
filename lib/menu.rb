require_relative 'order'

class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
      "Aloo Ghobi"           => 5.50,
      "Mac and Cheese"       => 6.00,
      "Chicken Tikka Masala" => 7.00,
      "Al Pastor Tacos"      => 6.00,
      "Poutine"              => 3.50,
      "Vegetable Gyozas"     => 3.50,
      "Naan"                 => 2.00,
      "Caesar"               => 5.50
    }
  end

  def print_menu
    @menu_items.each do |item, price|
      puts "#{item}: £#{sprintf("%.2f", price)}"
    end
  end

  def price(item)
    @menu_items[item]
  end
end
