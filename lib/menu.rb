require_relative 'dish'

# This class holds all of a resturants dish options
class Menu

  def initialize
    @list = []
  end

  def add_dish(dish) # Adds dish to the list array
    @list << dish
  end

  def list_dishes
    @list.each do |dish|
      print "| #{dish.name} $#{dish.price} |"
    end
  end

end
