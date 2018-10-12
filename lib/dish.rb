class Dish

  def initialize(name = "pudding", category = "drink")
    @name = name
    @category = category
    @price = DishPrice.new.return_price(category)
  end

  def publish_dish
    "For "<<@category<<" choose "<<@name<<" costing just "<<@price
  end
end



class DishPrice

  DEFAULT_PRICE = 50

  def initialize
    @pricemap = {drink: 5, desset: 10, main: 15}
  end

  def return_price(category)
    return @pricemap[category] if @pricemap.has_key?(category)
    else return DEFAULT_PRICE
  end
end
