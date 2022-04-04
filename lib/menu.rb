class Menu
  attr_reader :full_list

  def initialize 
    @full_list = []
  end

  def add_item(item,price)
    @full_list << { item: item, price: price }
  end
end
