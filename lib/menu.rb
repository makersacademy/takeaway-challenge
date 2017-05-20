class Menu
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add(item)
    @items << item
  end
  
end
