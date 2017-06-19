class Menu
  attr_reader :food_list

  def initialize
    @food_list = {
      "pancakes" => 5,
      "burger" => 6,
      "coke" => 2,
      "water" => 1
    }
  end

  def display_menu
    @food_list.each do |item, price|
      puts item + ": £" + price.to_s
    end
  end

end
