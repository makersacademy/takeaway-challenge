class Menu
  attr_reader :list

  def initialize
    @list = []
  end

  def add(item)
    @list << [item.name, item.price, item.quantity]
  end

  def show
    @list
  end
end
