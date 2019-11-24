class Dishes
  attr_reader :quantity, :name, :price

  def initialize
    @menu_list = []
  end

  def insert_a_dish(quantity, name, price)
    @menu_list << { quantity: quantity, name: name, price: price }
  end
end

class Menu
  def initialize
    @dishes = Dishes.new
  end

  def printed_menu(dishes)
    @dishes = dishes
  end
end

