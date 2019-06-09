class Order
  attr_reader :selection
  def initialize
    @selection = []
  end

  def add_items(dish, quantity)
    @selection << { dish: dish, quantity: quantity }
  end

  def hello
    p "hello"
  end
end
