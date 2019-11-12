class Menu
  attr_reader :dishes

  def initialize
    @dishes = {"Pizza" => 5, "Chips" => 2, "Curry" => 6.5}
  end

  def add(item, price)
    @dishes[item] = price
  end

  def has?(item)
    dishes.key?(item)
  end
end
