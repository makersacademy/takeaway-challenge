class Menu
  attr_reader :dishes
  def initialize
    @dishes = {}
  end
  
  def load_menu
    file = File.open("./lib/menu.csv", "r")
    file.readlines.each do |line|
      item, price = line.chomp.split(',')
      @dishes[item.to_sym] = price.to_f
    end
    file.close
  end
  
  def menu_print
    dishes.map do |item, price|
      "%s: £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end
  
  def price(item)
    @dishes[item]
  end
end
