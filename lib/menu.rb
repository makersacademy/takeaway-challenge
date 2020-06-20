class Menu
  attr_reader :dishes
  
  def initialize(name, price)
    @dishes = { name => price }
  end
  
end
