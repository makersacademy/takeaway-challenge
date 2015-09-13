class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def show
    puts "Menu: \n"
    dishes.each{ |dish| puts "#{dish.show_details}" + "\n"}
  end

  def add_dish(dish)
    dishes << dish
  end
end
