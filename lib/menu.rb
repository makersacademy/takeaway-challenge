class Menu

  ITEMS = {
    "Nan" => 2.20,
    "Rice" => 2.70,
    "Aloo Gobi" => 4.10,
    "Sag Paneer" => 4.30,
    "Daal Makhani" => 6.10
  }

  def print
    ITEMS.each do |item, price|
      puts "#{item}: £#{'%.2f' % price}\n"
    end
  end

end
