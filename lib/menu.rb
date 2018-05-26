class Menu
  attr_reader :juices

  def initialize
    @juices = [
      { "Matcha Greens Booster Shot": 2.49 },
      { "Strawberry Glow Cold Press Juice": 3.99 },
      { "Cherry Vit C Booster Shot": 2.49 },
      { "Turmeric Zing Cold Press Juice": 3.99 },
      { "Oh My Greens Cold Press Juice": 3.49 },
      { "Plant Protein Power Booster": 4.49 },
      { "Brilliant Beets Cold Press Juice": 3.49 }
    ]
  end

  def show_menu
    @juices
  end
end
