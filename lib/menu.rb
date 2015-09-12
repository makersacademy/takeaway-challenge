class Menu

  attr_reader :dishes_available

  def initialize
    @dishes_available = []
  end

  def add(dish)
    @dishes_available << dish
  end

end