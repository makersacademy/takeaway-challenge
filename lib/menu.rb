class Menu

  attr_reader :list

  def initialize
    @list = {}
  end

  def add_item(item, price)
    list[item] = price
  end

  def remove_item(item)
    list.delete(item)
  end

end
