class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def show
    dishes.map { |dish, price| "%s £%.2f" % [dish.to_s.capitalize, price] }.join(', ')
  end
  
end
