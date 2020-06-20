class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end
  def print
    dishes.map { |dish, price|
      p "#{dish} £#{('%.2f' % price)}"
      }.to_a.join(", ")
  end

end
