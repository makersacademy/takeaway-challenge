class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(item)
    @basket << item
  end

  def cost
    cost = 0
    basket.each { |item| cost += item[:price] }
    cost
  end

  def return_order
    @basket.each { |item| puts item[:name] }
    puts "Total: £#{cost}"
  end

end
