class Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_item(item, price)
    dishes[item] = price
  end

  def remove_item(item)
    dishes.delete(item)
  end

end
