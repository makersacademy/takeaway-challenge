class Menu
  
  attr_reader :dishes

  def initialize
    @dishes = {
      pizza: 10,
      burger: 7,
      paella: 15,
      carrot: 1,
      cake: 3
    }
  end

end