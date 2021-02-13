require 'menu'

class TakeAway
  attr_reader :basket
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end 

  def read_menu()
    @menu.dishes
  end 

  def add_to_basket(dish, quantity = 1)
    fail "#{dish} is not available" if @menu.dishes[dish] == nil
    @basket[dish] += quantity
  end

end 
