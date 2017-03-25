class Takeout

  attr_reader :menu_array

  def initialize
    @menu_array = []
    opened_menu_file = File.open('menu.csv', 'r')
    opened_menu_file.readlines.each do |line|
      dish, price = line.chomp.split(',')
      @menu_array << {dish: dish, price: price}
    end
    opened_menu_file.close
  end

  def menu
    
  end



end
