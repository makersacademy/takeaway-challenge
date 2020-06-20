class Menu
  attr_reader :list
  def initialize
    @list = []
  end

  def add(name,price)
    @list << {:name => name,:price => price.to_f}
  end
end