class Menu
  attr_reader :menu

  def initialize
    @menu = { 
      "Cod": 6,
    "Haddock": 6, 
    "Plaice": 6, 
    "Chips": 2, 
    "Sausage": 3 }
  end


  def see_menu
    @menu.select do |food, price|
      puts "#{food} £#{price}"
    end
  end
end