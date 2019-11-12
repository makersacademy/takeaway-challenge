class Menu
  attr_reader :dishes

  def initialize
    @dishes = {"Pizza" => 5, "Chips" => 2, "Curry" => 6.5}
  end

  def on_menu?(item)
    dishes.key?(item)
  end
end
