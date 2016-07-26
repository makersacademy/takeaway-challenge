class Basket
  attr_accessor :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish, number)
    @basket.key?(dish) ? @basket[dish] += number : @basket[dish] = number
  end

  def list
    basket.each do |key, value|
      puts "#{key} x #{value} : £#{'%.2f' % (Menu::DISHES[key]*value)}"
    end
  end

  def total
    @basket.inject(0) {|sum, (dish,quantity)| sum + Menu::DISHES[dish]*quantity}
  end

  def empty
    @basket = {}
  end

end
