class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"pizza" => 5, "coke" => 1}
  end

  def to_s
    "5"
  end
end
