class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map{ |dish, price| "#{dish}: £%0.2f" % [price] }.join(", ")
  end

end
