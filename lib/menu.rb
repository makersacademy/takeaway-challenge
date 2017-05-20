class Menu

  attr_reader :dishes, :prices

  def initialize(dishes, prices)
    @dishes = dishes
    @prices = prices
  end

  def list_dishes
    
    @dishes
  end

end
