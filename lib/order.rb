class Order

  attr_reader :list

  def initialize(list = [])
    @list = list
  end

  def choose(selection)
    @list << selection
  end

end
