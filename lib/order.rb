class Order

  attr_reader :contents

  def initialize
    @contents = []
  end

  def add_item(dish, quantity)
    @contents << dish
    @contents << quantity
  end

  

end
