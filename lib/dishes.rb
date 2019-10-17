class Dishes

  attr_reader :dishes

  def initialize
    @dishes = { "Chicken" => 5,
                "Noodles" => 3,
                "Steak" => 6 }
  end

  def list_dishes
    return @dishes
  end
end
