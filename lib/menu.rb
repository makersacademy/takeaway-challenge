class Menu

  attr_reader :menu

  MENU = { "Pepperoni Pizza" => 6, "Fish & Chips" => 4, "Chicken Jalfrezi" => 7, "Chow Mein" => 5, "Ceasar Salad" => 3 }

  def initialize
    @menu = MENU
  end

  def print_menu
    menu.each do |key, value|
      puts "#{key} : #{value}"
    end
  end

end
