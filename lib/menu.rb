class Menu
  attr_reader :dishes
  def initialize
    @dish_name
    @dish_price
    @dishes = []
  end

  def create_menu
    @dishes = [['Cheese', 1.50], ['Pizza', 4.00], ['Prawns', 3.50], ['Potatoes', 3.00], ['Tomatoes', 2.50]]
  end

  def add_dish(name, price)
    @dishes << [name, price]
  end
end
