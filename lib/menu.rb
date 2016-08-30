class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def has_dish?(dish)
    dishes.include?(dish)
  end
end
