class Restaurant
  attr_reader :dishes

  def initialize
    @name = "New Restaurant"
    @dishes = {
      "Sushi": 7.50, 
      "Burger": 6.10, 
      "Fries": 3.00,
      "Noodle Soup": 10.00,
      "Bahn Mi": 9.25
    }
  end
end
