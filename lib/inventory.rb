class Inventory
  attr_reader :dishes_list
  def initialize
    @dishes_list = {}
  end

  def make_list(dishes, quantity)
    @dishes_list[dishes] = quantity
  end
end
