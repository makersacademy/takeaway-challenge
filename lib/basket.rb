class Basket
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish, number)
    @basket.has_key?(dish) ? @basket[dish] += number : @basket[dish] = number
  end

  def read_order
    @basket.each do |key, value|
      puts "#{key} x #{value} : £#{Menu::DISHES[key]*value}"
    end
      puts "TOTAL : £#{total}"
  end

  def total
    @basket.inject(0) {|sum, (dish,quantity)| sum + Menu::DISHES[dish]*quantity}
  end

end
