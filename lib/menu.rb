class Menu

  attr_reader :list

  def initialize
    @list = Hash.new {0}
  end

  def add (dish, price)
    @list[dish]=price
    @list
  end

end
