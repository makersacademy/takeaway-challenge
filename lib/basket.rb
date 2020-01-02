class Basket
  def initialize
    @basket = []
  end

  def basket
    @basket.dup
  end

  def add(item)
    @basket << item
  end
end
