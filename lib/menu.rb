require './lib/dish'
class Menu
  attr_reader :dishes

  def initialize()
    @dishes = [
      Dish.new("Margherita", 8),
      Dish.new("Salami", 9),
      Dish.new("Hawaiiaan", 9),
      Dish.new("Chips", 4),
    ]
  end

  def list_of_dishes
    count = 1
    string = ""
      @dishes.each do |dish|
      string += "#{count}. #{dish.name} - £#{dish.price}
      "
      count += 1
      end
      return string
  end

end
