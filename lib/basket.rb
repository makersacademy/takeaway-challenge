class Basket
  attr_accessor :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish, number)
    @basket.key?(dish) ? @basket[dish] += number : @basket[dish] = number
  end

  def list
    basket.each do |dish, number|
      puts "#{dish} x #{number} : £#{'%.2f' % (Menu.price(dish)*number)}"
    end
  end

  def total
    @basket.inject(0) {|sum, (dish,quantity)| sum + Menu.price(dish)*quantity}
  end

  def empty
    @basket = {}
  end

end
