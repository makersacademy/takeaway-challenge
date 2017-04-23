class Menu

DISHES = {'biryani' => 3.99, 'butter chicken' => 4.50, 'chicken tikka' => 3.50, 'dal' => 1.99, 'tandoori chicken' => 4.99}
attr_reader :dishes

  def initialize(dish_list = DISHES)
    @dishes = dish_list
  end
  
end
