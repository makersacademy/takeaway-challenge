class Menu

  attr_reader :list

  def initialize
    @list = {
        "southern chicken" => 5.59,
        "chicken curry" => 5.49,
        "jerk chicken" => 5.59,
        "mamas meatballs" => 5.39,
        "kofta patties" => 5.99,
        "pasta primavera" => 4.99,
        "vegan moussaka" => 5.29 }
  end

end
