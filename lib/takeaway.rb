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

  def order(item, quantity = 1)
    basket[item] += quantity
    "#{quantity}x #{item}(s) added to your basket."
  end

  def basket_summary
    basket.map { |item, quantity| "#{item} x#{quantity} = #{'£%.2f' % (dishes[item] * quantity)}" }.join(', ')
  end

  def total
    total = basket.map { |item, quantity| dishes[item] * quantity }.inject(:+)
    "Total: #{'£%.2f' % total}"
  end

end
