class Order
  
  attr_reader :price_list, :selection
  
  def initialize(price_list)
    @price_list = price_list
  end
  
  def create(selection)
    @selection = selection
  end
end
