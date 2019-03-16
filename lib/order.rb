class Order

  attr_reader :contents

  def initialize
    @contents = []
  end

  def add (dish, quantity)
    @contents << { name: dish.name, price: dish.price, quantity: quantity }
  end
end
