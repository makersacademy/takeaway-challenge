class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def read 
    dishes.map do |name, price|
      '%s £%.2f' % [name, price]
    end.join(", ")
  end
    
end
