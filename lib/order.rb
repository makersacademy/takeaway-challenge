require 'menu'
attr_accessor :total, :lists_dishes

class Order

  def initialize(total, lists_dishes)
    @total = 0
    @lists_dishes = [] 
  end
 
  def add(dish)
    @lists_dishes << "#{dish.name} = £#{dish.price}"
    @total += dish.price
  end

  def add(dish)
    @lists_dishes << "#{dish.name} = £#{dish.price}"
    @total += dish.price
  end 
end