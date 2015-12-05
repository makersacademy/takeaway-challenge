class Order

  DEFAULT_QUANTITY = 1

  attr_reader :basket

  def initialize
    @basket = Hash.new
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    quantity = @basket[item] + quantity if already_in_basket?(item)
    @basket[item] = quantity
  end

private

  def already_in_basket?(item)
    @basket[item]
  end

end
