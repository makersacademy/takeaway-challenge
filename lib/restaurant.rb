class Restaurant
  attr_reader :menu, :on_menu

  def initialize
    @menu = menu
  end

  def menu
    @menu = {
      "friendly chicken": 7.50,
      "angry chicken": 7.50,
      "furious chicken": 7.50,
      "angry beef burger": 11.00,
      "happy vegan burger": 9.00,
      "chips": 2.50
    }
  end

  def on_menu?
    menu.key?
  end
end
