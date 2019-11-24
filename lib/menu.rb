class Menu

  attr_reader :dishes, :basket

  def initialize
    @dishes = {"Hamster Soup" => 11.50, "Orechiette" => 4.40, "Vegan Offal" => 1.10}
    @basket = []
    @total = 0
  end

  def total
  @total.round(3)
  end

  def open
  @dishes
  end

  def choose(dish, quantity)
    @dishes.select do |name, price|
      if name == dish
        quantity.times do @basket << "#{name}, £#{price}" end
        quantity.times do  @total += price end
      end
    end
  end

end
