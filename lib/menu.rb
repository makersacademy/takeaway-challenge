class Menu
  attr_reader :list

  def initialize
    @list = {"Chips" => 3, "Salad" => 4, "Chicken" => 7, "Fish" => 9, "Daily special" => 15}
  end

  def view
    list
  end
end
