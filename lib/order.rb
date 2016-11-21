class Order

  attr_accessor :basket

  def initialize
    @basket = []
  end

  def view_basket
    self.basket.each { |line| puts "#{line[:qty]}x #{line[:item]} @ £" + "%.2f" % line[:price] }
    puts "Total = £#{calculate_total}"
  end

  def calculate_total
    self.basket.each.inject(0) { |sum, line| sum + (line[:price] * line[:qty])}
  end

end
