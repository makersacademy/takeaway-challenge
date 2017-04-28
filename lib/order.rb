require './lib/list'
class Order

  attr_reader :basket
  attr_accessor :list
  
  def initialize

    @basket = []
    @list = List.new

  end

  def order_food(dish)
    @basket << list.dishes[dish - 1]
  end
end
