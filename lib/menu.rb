class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"Pizza" => 5.00, "Coke" => 1.00}
  end

  def to_s
    "Pizza: $5.00,  Coke: $1.00"
  end
end
