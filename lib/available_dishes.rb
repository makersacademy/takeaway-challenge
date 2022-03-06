class AvailableDishes

  attr_accessor :array_of_dishes

  def initialize(array_of_dishes = [])
    @array_of_dishes = array_of_dishes
  end

  def show_dishes
    array_of_dishes.map { |dish| "#{dish.name} - £#{dish.price}" }.join("\n")
  end

end
