class Order
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(*dish_and_quantity)
    @dishes = Hash[*dish_and_quantity.flatten]
    # @dishes[dish] = quantity
  end

end
