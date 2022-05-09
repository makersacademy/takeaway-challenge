class Ordering

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(item, price)
    @basket << {:item=>item, :price=>price}
  end
end
