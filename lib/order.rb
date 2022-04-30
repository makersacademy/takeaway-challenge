class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(dishes)
    dishes.each { |dish| basket << dish }
  end
  
end
