class Basket
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add_dish(dish, quantity = 1)
    quantity.times { contents << dish }
  end

end
