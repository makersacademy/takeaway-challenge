require_relative "dish"

class Order

  attr_reader :dishes

  def initialize
    @total = 0
    @dishes = Dishes.new
end

def order(dish, quantity)

end

end
