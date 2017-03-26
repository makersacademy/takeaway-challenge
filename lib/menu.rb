class Menu

  attr_reader :dishes, :desserts

  def initialize
    @dishes = {lasagna: 10, burger: 5}
  end

  def show_dishes
    dishes.map do |dish, price|
      "#{dish}: #{price}"
    end.join(", ")
  end

  def add_dish(dish, price)
    dishes[dish.to_sym] = price
  end

end
