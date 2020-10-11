class Ordering

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add
    @basket << {:item=>item, :price=>price}
  end
end
