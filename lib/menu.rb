class Menu

  def initialize
    @menu = {:king_burger => 8, :cheese_burger => 7, :chicken_burger => 7 }
  end

  def read
   puts @menu.dup
  end

  def pick(dish)
    raise "Sorry, that item is not on the menu" if !@menu.include?(dish)
    @menu.select { |key, value| key == dish }
  end

  def price(dish)
    @menu[dish]
  end

end
