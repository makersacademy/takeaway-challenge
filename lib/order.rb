class Order

  attr_reader :choice

  def initialize
    @choice = []
  end

  def add(food, number = 1)
    number.times { @choice << food }
    choice
  end

end
