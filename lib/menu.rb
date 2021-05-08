class Menu

  DEFAULT_MENU = {
    Pita: 2.50,
    Dolmades: 6.50,
    Musaka: 7.99,
    Zazzikki: 4.99
  }


  def initialize(items = DEFAULT_MENU)
    @items = items
  end 

  def display
    @items.map { |dish, price| "#{dish.to_s.capitalize}: £#{price.round(2)}"}
  end

end 