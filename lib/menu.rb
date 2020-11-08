class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(name, price)
    @dishes.push({ :name => "Bacalhau com natas", :price => 7.5})
  end

end
