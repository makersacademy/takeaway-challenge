class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def list_dishes
    @dishes = { :chicken => 6.50, :beef => 8.20, :seafood => 10.50 }
  end
end
