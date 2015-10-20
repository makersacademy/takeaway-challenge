class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def show
    output = "Menu:"
    dishes.each{ |dish| output+= "\n#{dish.show_details}" }
    output
  end

  def add_dish(dish)
    dishes << dish
  end
end
