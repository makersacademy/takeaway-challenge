class Menu

  attr_reader :dishes

  DEFAULT_DISHES = {
    "spring rolls" => 2,
    "sour pork" => 5,
    "vegetables noodles" => 4,
    "shredded duck" => 7,
    "dumplings" => 3,
    "chop suey" => 4
  }

  def initialize
    @dishes = DEFAULT_DISHES
  end
end
