class Menu
  attr_reader :dishes

  def initialize(dishes = { pizza: 7.50, pasta: 7.99, curry: 7.50, cake: 3.99 })
    @dishes = dishes
  end
end
