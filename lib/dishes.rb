class Dishes

  def initialize
  @dishes = []
  end

  attr_reader :dishes, :view

  def create_dish(name, price)
    self.dishes << {name: name, price: price}
  end

  def view
    dishes
  end

  private
  attr_writer :dishes
end
