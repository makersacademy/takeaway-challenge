class Takeaway
  attr_reader :dishes, :basket

  DISHES = { 'chicken gyoza' => 4.00,
             'singapore fried noodles' => 7.00,
             'salmon maki' => 5.50,
             'kimchi' => 3.00,
             'vegetable tempura' => 7.00,
             'beef soup ramen' => 6.50 }

  def initialize(dishes = DISHES)
    @dishes = DISHES
    @basket = Hash.new(0)
  end

  def open_menu
    dishes.map { |item, price| "#{item}: #{'£%.2f' % price}" }
  end

end
