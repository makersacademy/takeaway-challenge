class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def has_dish?(dish)
    @dishes.include?(dish)
  end
  
end