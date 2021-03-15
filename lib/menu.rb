class Menu

  def initialize
    @dishes = [Dish.new("Scrambled Eggs", 5),
                Dish.new("Steak", 15),
                 Dish.new("Hot Sauce", 3),
                  Dish.new("Hash Browns", 5)]
  end

  def list_dishes
    @dishes
  end

end
