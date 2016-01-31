class Menu


  def initialize
    @prices = {"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2 }
  end

  def show_menu
    @prices
  end

  def price_of(dish)
    @prices[dish]
  end
end