class Menu
  attr_reader :basket

  MENU_LIST = [
    { "1. Margarita" => 8 },
    { "2. Ham and Pineapple" => 9 },
    { "3. The Mo Salah" => 12 },
    { "4. Meatilicious" => 11 },
    { "5. Veggie McVegface" => 7 },
    { "6. The LFC Pizza" => 15 }
  ]

  def initialize
    @basket = []
  end

  def print_menu
    puts "Here is our list of pizzas:"
    MENU_LIST.each do
      |item| item.each { |food, price| puts "#{food}, £#{price}" }
    end
  end

  def select_dish(dish_number, quantity)
    quantity.times { @basket << MENU_LIST[dish_number - 1] }
    "You have added #{quantity} of the #{MENU_LIST[dish_number - 1]}
    pizzas to your basket"
  end
end
