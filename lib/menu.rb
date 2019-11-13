class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(item, price)
    @dishes[item] = price
  end

  def has?(item)
    dishes.key?(item)
  end
end
