class Order
  def initialize
    @basket = Hash.new(0)
  end

  def add(item, qty)
    @basket[item.to_sym] += qty
  end

  def basket
    @basket.dup
  end
end