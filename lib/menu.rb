class Menu

  def initialize(dishes:)
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end
  
end
