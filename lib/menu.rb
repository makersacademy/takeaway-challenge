class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def show
    @dishes.each { |dish| puts "#{dish.name}, £#{dish.price}\n" }
  end

end
