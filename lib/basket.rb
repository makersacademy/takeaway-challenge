class Basket 
  attr_reader :basket

  def initialize
    @basket = {}
  end
  
  def add_item(item, price)
    @basket[item] = price
  end

end