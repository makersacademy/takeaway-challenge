class Menu

  attr_reader :dishes, :prices

  def initialize(dishes, prices)
    @dishes = dishes
    @prices = prices
  end

  def list_dishes
    { :Starters => ["Olives", "Pitta bread,"], :Main_course => ["Fried duck", "Fish & Chips"], :Dessert => ["Jam roll", "Apple crumble"] }
  end

  def list_prices
    { :Starters => [4, 5], :Main_course => [12, 9], :Dessert => [5, 6] }
  end

end
