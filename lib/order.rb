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

  def total
    item_totals.inject(:+)
  end

  private

  attr_reader :list
  def item_totals
   dishes.map do |dish, quantity|
      list.price(dish) * quantity
    end
  end
end

class NoItemError < StandardError; end