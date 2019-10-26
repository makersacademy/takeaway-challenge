class Order
  attr_reader :basket
  def initialize(menu)
    @basket = []
    @menu = menu
    @total = 0
  end

  def add(item)
    fail "This item does not exist on the menu" if !(@menu.available?(item))
    @basket << item
  end

  def remove(item)
    @basket.delete(item)
  end

  def calculate_total
    for dish in basket
      @total += dish.price
    end
    return @total
  end

end