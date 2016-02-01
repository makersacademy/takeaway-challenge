class Order

  attr_reader :dishes

 def initialize(list)
    @dishes = {}
    @list = list
 end

  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} is not on the list!" unless list.has_dish?(dish)
    dishes[dish] = quantity
  end

  private

  attr_reader :list
end

class NoItemError < StandardError; end