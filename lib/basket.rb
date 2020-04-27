class Basket

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def adding(dish,value)
    dish[:price] *= value
    @dishes << dish
  end

  def total
    total = 0
    for i in 0...@dishes.count
      total += @dishes[i][:price]
    end
    return total
  end

end
