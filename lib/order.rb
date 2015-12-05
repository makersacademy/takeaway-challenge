class Order

  DEFAULT_QUANTITY = 1

  attr_reader :basket

  def initialize
    @basket = Hash.new
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    quantity = @basket[item] + quantity if @basket[item]
    @basket[item] = quantity
  end


private

  

end
