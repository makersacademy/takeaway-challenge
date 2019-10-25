class Dish
  attr_reader :dishes

  def initialize(dishes = 5)
    @dishes = dishes
    p dishes
    #@dishes = {
    # "chocolate": 5,
    #"wine": 6,
    #}
  end
end
