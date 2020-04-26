class Menu
attr_reader :items

  def initialize
    @items = []
  end

  def add_dish(name, price)
    @items << { name: name, price: price }
  end

end
