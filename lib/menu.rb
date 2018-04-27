class Menu

  attr_reader :list

  def initialize
    @list = [{ "Southern Chicken" => 5.50 },
            { "Chicken Katsu Curry" => 5.50 },
            { "Jerk Chicken" => 5.50 },
            { "Mamas Meatballs" => 5.30 },
            { "Kofta Patties" => 5.90 },
            { "Pasta Primavera" => 5.00 },
            { "Vegan Moussaka" => 5.20 }]
  end
end
