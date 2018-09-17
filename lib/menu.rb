class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "doughnut" => 2,
      "cake" => 2,
      "pancakes" => 3,
      "ice-cream" => 2
    }
  end

  def display_menu
    dishes.map do |dish, price|
        "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

end
