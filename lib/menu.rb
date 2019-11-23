class Menu

  attr_reader :dishes, :basket, :total

  def initialize
    @dishes = {"Hamster Soup" => 11.50, "Orechiette" => 4.40, "Vegan Offal" => 1.10}
    @basket = []
    @total = 0
  end

  def open
  @dishes
  end

  def choose(dish)
    @dishes.select do |name, price|
      if name == dish
        @basket << "#{name}, £#{price}"
        @total += price
      end
    end
  end

end
