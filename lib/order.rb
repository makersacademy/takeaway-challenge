class Order
  def initialize(dishes)
    @dishes = dishes
    # IDEA: this should be passed in and checked internally
    @price = 0
  end
end
