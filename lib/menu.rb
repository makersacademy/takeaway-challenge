class Menu

  attr_reader :list

  def initialize
    @list = {}
  end

  def display
    list
  end

  def add_item(food,price)
    @list.store(food,price)
  end

end
