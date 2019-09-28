class Order

  def initialize(dishes = Dishes.new)
    @dishes = dishes
    @basket = []
  end

  def add(item, quantity)
    return "Sorry, that item was not found" unless (@dishes.indian || @dishes.chinese || @dishes.italian || @dishes.drinks).include?(item.to_sym)
    @basket << "#{item} " * quantity
  end

  def remove
  end

  def order_summary
  end

  def checkout
  end


end
