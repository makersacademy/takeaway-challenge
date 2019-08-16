class Basket
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def list
    dishes.each { |dish| puts "#{dish.name}: #{dish.price}" }
  end
  
  def empty
    @dishes = []
  end

  def total
    @dishes.map(&:price).sum
  end
end
