class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"pizza" => 3.00, "coke" => 1.00}
  end

  def to_s
    "Pizza: $5.00,  Coke: $1.00"
  end
end
