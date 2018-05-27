class Menu
  attr_reader :juices

  def initialize
    @juices = {
      "Matcha Greens Booster Shot" => 2.49,
      "Strawberry Glow Cold Press Juice" => 3.99,
      "Cherry Vit C Booster Shot" => 2.49,
      "Turmeric Zing Cold Press Juice" => 3.99,
      "Oh My Greens Cold Press Juice" => 3.49,
      "Plant Protein Power Booster" => 4.49,
      "Brilliant Beets Cold Press Juice" => 3.49
    }
  end

  def show_menu
    @juices
  end

  def on_menu?(juice)
    not_on_menu_error unless juice_on_menu?(juice)
    return true
  end

  private

  def not_on_menu_error
    raise "This juice is not on the menu!"
  end

  def juice_on_menu?(juice)
    @juices.keys.include? (juice)
  end
end
