class Takeaway
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def list_of_dishes(dish)
  @dishes << dish
  end
end

class Dish

end
