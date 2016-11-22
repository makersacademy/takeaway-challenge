class Basket
  def initialize
    @basket_list = Hash.new(0)
  end

  def add(dish, quantity =1)
    @basket_list[dish] += quantity
    return @basket_list
  end

  def summary
    @basket_list.collect{|key,value| BasketItem.new(key,value)}
  end

end
