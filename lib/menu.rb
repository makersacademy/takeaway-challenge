class Menu
  attr_reader :items
  ITEMS = { "pizza" => 10, "pasta" => 8, "chips" => 3, "burger" => 7, "milkshake" => 5 }
  
  def initialize
    @items = ITEMS
  end

  def show_menu
    @items.each do | dish, price |
      puts "#{@items.keys.index(dish) + 1}. #{dish} - #{price}"
    end
  end
end