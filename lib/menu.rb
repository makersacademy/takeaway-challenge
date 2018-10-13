require_relative 'dish'

# This class holds all of a resturants dish options
class Menu

  def initialize
    @list = []
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
      name if name.name == dish
    end
  end
end
