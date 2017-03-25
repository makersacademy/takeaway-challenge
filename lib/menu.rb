class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"Hamburger" => 3.99, "Pizza" => 9.99, "Fish and Chips" => 4.99, "Curry" => 5.99}
  end
end
