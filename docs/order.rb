require './docs/dishes.rb'
class Order

  attr_reader :total

  def initialize(dishes = Dishes)
    @dishes = dishes
    @total = 0
  end

  def select(dish)
    @dishes_class = @dishes.new
    # @total += @dishes_class.price(dish)
  end
end
