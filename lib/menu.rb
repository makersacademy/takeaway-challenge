class Menu 
  attr_reader :dishes
  def initialize
    @dishes = {}
  end

  def show
    @dishes
  end
end