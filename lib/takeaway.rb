class Restaurant
  
    attr_reader :dishes_with_prices
  
  def initialize
    @dishes_with_prices = {}
  end

  def list
    @dishes_with_prices = 
    {
        'Green Tea' => 2,
        'Earl Grey' => 2,
        'Oat milk latte' => 3,
        'Cappucino' => 3,
        'Americano' => 2,
        'Espresso' => 2,
        'Hot Chocolate' => 3,
        'Chocolate muffin' => 1,
        'Lemon muffin' => 1,
        'Carrot cake' => 1 
    }
  end

end