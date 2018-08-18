module Dishes
  
  MENU = {
    "Burger & Chips" => 7,
    "Donner Kebab" => 8,
    "Mystery Curry" => 9,
    "Hoisin Duck Pankcakes" => 10
  }
  
  def list
    MENU.each do |dish, price|
      puts "#{dish} - £#{price}"
    end
  end

end