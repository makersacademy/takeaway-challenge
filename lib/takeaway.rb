require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def menu
    @menu.show
  end

  def order(choice, *number)
    # fail "Sorry we don't have that" if !available?
    choice

  end

  # def available?(choice)
  #   if Menu::MAINS.has_key?(choice) || Menu::SIDES.has_key?(choice) || Menu::DRINKS.has_key?(choice)
  #     true
  #   else
  #     "Sorry, we don't have that right now."
  #   end
  # end


  # def price(str)                     intended to take out price when given
  #   DISHES[str] || DISHES.key(str)     string ie dish.
  # end

end
