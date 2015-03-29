class Restaurant
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def load_dishes(dish)
    @dishes << dish
  end

  # def list_dishes
  #   @dishes
  # end
end
