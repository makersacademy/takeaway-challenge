class Order

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def select_dish(name = nil, quantity = 1)
    @name = name
    @quantity = quantity
    @dishes << {:name => name, :quantity => quantity}
  end
end
