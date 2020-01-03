class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
      "Hummus" => 5,
      "Falafel Plate" => 10,
      "Gyro" => 12,
      "Soft Drink" => 2,
      "Pita" => 1,
    }
  end

  def all
    @dishes
  end

end
