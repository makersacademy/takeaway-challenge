class Menu
  attr_reader :menu_list
  def initialize
    @menu_list = {
      "Cheeseburger" => 5,
      "BBQ Ranch Burger" => 8,
      "Curly Fries" => 3,
      "Hotdog" => 4,
      "Fake Burger" => 6,
      "Spicy Fries" => 5
    }
  end

  def list_menu
    @menu_list.each_with_index do |(dish, price), index|
      puts "#{index + 1}. #{dish.ljust(20)}    £#{price}"
    end
  end

end
