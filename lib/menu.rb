class Menu
  attr_reader :dishes

  DISHES = { 'hawaian pizza' => 6,
             'beef noodles' => 5,
             'chicken tikka massala' => 6,
             'pepperoni pizza' => 5 }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def display
    @dishes.map { |k, v| "#{k}: £#{v}" }
  end

end
