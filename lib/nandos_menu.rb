class NandosMenu

  def initialize
    @dishes = {
      "Quarter Chicken" => 4,
      "Half Chicken" => 8,
      "Whole Chicken" => 13,
      "Chicken Wing" => 1
    }
  end

  def dishes
    @dishes.dup
  end

  def show_menu
    @dishes.map { |dish, price| "#{dish}: £#{price}" }.join("\n")
  end
end
