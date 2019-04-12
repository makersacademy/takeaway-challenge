class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{ name: "pizza", price: 6.00 }, { name: "pasta", price: 6.50 }]
  end

end
