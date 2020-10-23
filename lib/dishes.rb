class ListOfDishes

  def initialize
    @dishes = {
      "rice" => 1,
      "noodles" => 2,
      "sweet and sour chicken" => 6,
      "crispy beef" => 7,
      "aromatic duck" => 15,
      "chicken chow mein" => 4
    }
  end

  def read_dishes
    @dishes
  end

  def print
    @dishes.each_with_index do |(name, cost), index|
      return "#{index + 1}. #{name}: £#{cost}"
    end
  end

end
