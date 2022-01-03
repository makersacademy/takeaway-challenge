class Basket 
  attr_reader :basket

  def initialize
    @basket = []
  end
  
  def add_item(item)
    @basket << item
  end

end