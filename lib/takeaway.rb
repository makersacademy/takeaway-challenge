class Takeaway
  attr_reader :dishes, :basket, :total

  DISHES = { 'chicken gyoza' => 4.00,
             'singapore fried noodles' => 7.00,
             'salmon maki' => 5.50,
             'kimchi' => 3.00,
             'vegetable tempura' => 7.00,
             'beef soup ramen' => 6.50 }

  def initialize(dishes = DISHES)
    @dishes = dishes
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
    @total = basket.map { |item, quantity| dishes[item] * quantity }.inject(:+) unless basket.empty?
    "Total: #{'£%.2f' % @total}"
  end

  def checkout(amount = 0)
    fail "Total cost does not match the sum of the dishes in your order!" if amount != total
    "Thank you for your order: £#{'£%.2f' % @total}."
  end
end