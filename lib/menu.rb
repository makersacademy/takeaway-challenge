class Menu
  attr_reader :basket

  MENU_LIST = [
    { "Margarita" => 8 },
    { "Ham and Pineapple" => 9 },
    { "The Mo Salah" => 12 },
    { "Meatilicious" => 11 },
    { "Veggie McVegface" => 7 },
    { "The LFC Pizza" => 15 }
  ]

  def initialize
    @basket = []
  end

  def print_menu
    puts "Here is our list of pizzas:"
    MENU_LIST.each do
      |item| item.each { |food, price| puts "#{food}, £#{price}"}
    end
  end
end
