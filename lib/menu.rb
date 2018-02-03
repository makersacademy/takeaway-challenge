class Menu

  attr_reader :items

  def initialize
    @items = {
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     }
  end
end
