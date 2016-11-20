class BasketItem

  def initialize(dish,quantity)
    @dish = dish
    @quantity = quantity
  end

  def name
    @dish.name
  end

  def quantity
    @quantity
  end

  def sub_total
    @dish.price * @quantity
  end

end
