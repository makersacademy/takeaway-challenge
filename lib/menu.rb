class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{ name: "Pizza", price: 6.00 }, { name: "Pasta", price: 8.00 }]
  end

end
