class Order
  attr_reader :dish, :quantity

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
end

# class Order
#   attr_reader :dishes
#
#   def initialize
#     @dishes = {}
#   end
#
#   def add(dish, quantity)
#     dishes[dish] = quantity
#   end
# end
