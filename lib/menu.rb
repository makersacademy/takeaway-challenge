# This class holds all of a resturants dish options
class Menu

  def initialize
    @list = []          # holds dishes
    @loaded_dish = nil  # needed so that find dish returns a dish
  end

  def add_dish(dish)
    @list << dish # adds dish to the list array
  end

  def list_dishes
    print_dishes  # prints the menu
  end

  def find_dish(dish)
    search_menu(dish) # searches for the dish in the menu
    @loaded_dish      # returns the found dish
  end

  private

  # Itterates the list array and prints the dishes and prices
  def print_dishes
    @list.each do |dish|
      print "| #{dish.name} $#{dish.price} |"
    end
  end

  # Itterates the list array to find the dish that matches
  def search_menu(dish)
    @list.each do |name|
      @loaded_dish = name if name.name == dish
    end
  end
end
