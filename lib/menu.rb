# This class holds all of a resturants dish options
class Menu

  def initialize
    @list = []
    @loaded_dish = nil
  end

  def add_dish(dish)
    @list << dish # Adds dish to the list array
  end

  def list_dishes
    @list.each do |dish|
      print "| #{dish.name} $#{dish.price} |"
    end
  end

  def find_dish(dish)
    @list.each do |name|
      @loaded_dish = name if name.name == dish
    end
    @loaded_dish
  end
end
