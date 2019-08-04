class Menu
  attr_reader :list
  def initialize
    @list = {}
  end

  def dish(name, price)
    @list[name] = price
  end
end
