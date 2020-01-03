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

  def clear
    @basket = []
  end

  def empty?
    basket.empty?
  end
end
