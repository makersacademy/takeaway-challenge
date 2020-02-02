class Basket

  def initialize
    @basket = []
  end

  def add(*dish)
    dish.each { |item| @basket << item }
  end

  def total
    @basket.inject(0) { |total, dish| total + dish.price }
  end

  def view
    @basket.each { |dish| puts "#{dish.name} - £#{dish.price}" }
    print "Total: #{total}"
  end

end
