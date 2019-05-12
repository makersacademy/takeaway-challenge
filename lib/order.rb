class Order

  attr_reader :choice

  def initialize
    @choice = []
  end

  def add(dish, number = 1)
    raise "#{dish} is not available" if dish.available? == false
    number.times { @choice << dish }
    choice
  end

end
