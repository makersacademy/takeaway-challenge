class Menu
attr_reader :dishes

  def initialize
    @dishes = {'spring rolls' => 3.99 , 'crispy duck' => 11.95, 'chop suey' => 10.95, 'fried rice' => 4.99}
  end

  def see_dishes
    dishes
  end

end
