class Menu
  # attr_reader :dishes

  DISHES = { "Green Curry" => 6,
             "Massaman Curry" => 6,
             "Panang Curry" => 6,
             "Pad Thai" => 7,
             "Rice" => 2,
             "Pad Pak" => 3,
             "Singha" => 4 }

  # def initialize
  #   @dishes = DISHES
  # end

  def print_menu
    DISHES.each do |item, price|
      puts "#{item}: £#{price}"
    end
  end

end
