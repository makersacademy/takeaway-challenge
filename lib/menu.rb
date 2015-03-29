class Menu
  attr_reader :list
  def initialize
    @list = { Burger: 5, Pizza: 10, Coke: 1 }
  end
end
