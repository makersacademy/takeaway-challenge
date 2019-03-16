class Menu
  attr_reader :items
  
  ITEMS = {
    "Nan" => 2.20,
    "Rice" => 2.70,
    "Aloo Gobi" => 4.10,
    "Sag Paneer" => 4.30,
    "Daal Makhani" => 6.10
  }

  def initialize(items = ITEMS)
    @items = items
  end

  def print
    ITEMS.each do |item, price|
      puts "#{item}: £#{'%.2f' % price}\n"
    end
  end

end
