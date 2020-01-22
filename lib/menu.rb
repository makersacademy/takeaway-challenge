class Menu

  attr_reader:list

  def initialize
    @list = []
  end

  def add(item,price)
    @list << { item => price }
  end
end
