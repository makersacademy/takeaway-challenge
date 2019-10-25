class Dish
  attr_reader :dishes

  def initialize
    @dishes = {
      "chocolate": 5,
      "wine": 6,
    }
  end
end
