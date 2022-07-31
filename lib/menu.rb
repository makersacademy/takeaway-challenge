class Menu
  attr_reader :dishes
  def initialize 
    @dishes = {
    'Fried Rice' => 15,
    'Jollof Rice' => 10,
    'Beans and stew' => 7,
    'Yam and Egg' => 7 
    }
  end

  def list_dishes
    @dishes.collect { |dish, price|
      "#{dish}: £#{price}"
    }
  end 
end
