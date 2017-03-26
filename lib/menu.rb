class Menu
  attr_reader :dishes

  def initialize
    @dishes = {'Chicken' => 12.50,
               'Pizza' => 10,
               'Pasta'=> 8.99,
               'Steak'=> 25.99}
  end

  def contain_item?(dish)
    self.dishes.include?(dish) ? true : "#{dish} not available in menu"
  end

  def dish_price(dish)
    self.dishes[dish]
  end


end
