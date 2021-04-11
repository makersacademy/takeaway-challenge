class Basket
  attr_reader :store
  def initialize
    @store = {}
  end

  def add(item, quantity)
    store[item] = quantity
  end
end
