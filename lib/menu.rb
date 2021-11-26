class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def show
    return @dishes.each { |dish| "#{dish.name}, £#{dish.price}\n" }
  end

end
