class Menu

  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def show
    @dishes.map { |dish| "#{dish.name} - £#{dish.price}\n" }.join("")
  end

end
