class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def create(name, price)
    @dishes[name] = price
  end

end
