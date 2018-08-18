class Menu
attr_reader :dishes

  def initialize
    @dishes = {spring_rolls: 3.99 , crispy_duck: 11.95, chop_suey: 10.95, fried_rice: 4.99}
  end

  def see_dishes
    dishes
  end

end
