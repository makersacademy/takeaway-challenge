# This first class is going to represent the dishes of the restaurant
class Menu 

  MENU = [{ name: 'Pizza', price: 4 }, 
    { name: 'Curry', price: 5 }, 
    { name: 'Roast_Dinner', price: 9 }]

  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def list_dishes
    @dishes
  end

  def price(item)
    @dishes.find { |hash| hash[:name] == item }[:price]
  end
end
