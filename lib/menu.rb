class Menu
  attr_reader :dishes

  DISHES = { 'chicken gyoza' => 4.00,
             'singapore fried noodles' => 7.00,
             'salmon maki' => 5.50,
             'kimchi' => 3.00,
             'vegetable tempura' => 7.00,
             'beef soup ramen' => 6.50 }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def open
    dishes.map { |item, price| "#{item}: £#{'%.2f'%price}" }
  end
end