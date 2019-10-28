class Basket
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def set_basket(item, quantity)
    if @basket.include?(item)
      @basket[item] += quantity
    else
      @basket[item] = quantity
    end
    "#{quantity}x #{item} added to basket."
  end

end
