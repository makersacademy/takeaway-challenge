class Menu

  attr_reader :dishes, :list_dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    add_to_dishes(dish)
  end

  def list_dishes
    print_each_dish
  end

private

  def add_to_dishes(dish)
    @dishes << dish
  end

  def print_each_dish
    @dishes.each { |dish| print dish }
  end

end
