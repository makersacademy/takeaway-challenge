class Order
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add(item)
    @basket << item
  end

  def remove
    # remove meal from basket hash
  end

  def current_total
    # returns total from basket
  end

end
