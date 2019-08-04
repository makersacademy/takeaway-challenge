class Menu

  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def show
    @dishes.map { |dish| "#{dish.name} - £#{dish.price}\n" }.join("")
  end

  def update(new_dishes)
    @dishes = new_dishes
  end

end
