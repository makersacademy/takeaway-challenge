class Menu

attr_reader :list

  def initialize
    @list = {
    "muffin" => 3,
    "croissant" => 3,
    "bagel" => 3,
    "cookie" => 2,
    "brownie" => 3,
    "cake" => 10,
    "struddle" => 3,
    "bread_loaf" => 8,
    "pie" => 10,
    "pastry" => 3,
    "tart" => 2
    }
  end

  def print_menu
    @list.each do |food, price|
      puts "#{food.capitalize}: $#{price}"
    end
  end

end
