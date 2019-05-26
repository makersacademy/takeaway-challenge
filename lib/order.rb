class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @menu = {"Tom Yum" => 9.95, "Pad Thai" => 10.00, "California Roll" => 12.00, "Red Curry" => 6.00, "Green Curry" => 6.00, "Summer Pudding" => 4.00, "Margarita" => 8.00}
  end

  def add(dish,number)
    @menu.each { |k,v| new_value = v * number
      if k == dish
        @basket.store(k,new_value)
      end
    }
  end

  def remove(dish)
    @basket.each { |k,v| k == dish ? @basket.delete(k) : "No such dish in basket" }
  end

  def total
    @basket.values.inject { |a,b| a + b }
  end

end
