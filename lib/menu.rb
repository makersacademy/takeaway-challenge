class Menu

  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def add_dish(item, price)
    @dishes << {item => price}
  end

end
