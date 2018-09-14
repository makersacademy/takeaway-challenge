class Menu
  
  def initialize
    @dishes = []
  end

  def add_dish(name, price)
    dish = { Name: name, Price: price }
    @dishes.push(dish)
  end

  def display
    @dishes
  end

end