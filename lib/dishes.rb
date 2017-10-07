class Dishes

  attr_reader :list

  def initialize
    @list = []
  end

  def add_item(name, price)
    @list << { name: name, price: price }
  end

end
