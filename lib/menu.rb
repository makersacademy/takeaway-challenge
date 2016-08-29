class Menu

  attr_reader :menu

  def initialize
    @menu =
    {"Spring Rolls" => 3,
      "Prawn Crackers" => 1,
      "Chicken Satay" => 7,
      "Thai Green Curry" => 8,
       "Rice" => 2,
     "Pancakes" => 3}
  end


  def print_menu
    menu.each do |menu, price|
      puts "#{menu}"
  end
  end

  def print_price(item)
    menu[item]
  end


end
