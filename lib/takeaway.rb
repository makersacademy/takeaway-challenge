class Menu

  attr_reader :items

  def initialize
    @items = {
      chicken: 5.0,
      pizza: 6.5,
      burrito: 4.0,
      nachos: 3.5,
      chips: 1.5
    }
  end

end
