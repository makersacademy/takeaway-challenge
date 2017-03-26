class Takeout

  attr_reader :menu, :my_order, :total

  def initialize
    @menu = []
    opened_menu_file = File.open('menu.csv', 'r')
    opened_menu_file.readlines.each do |line|
      dish, price = line.chomp.split(',')
      menu << {dish: dish, price: price}
    end
    opened_menu_file.close

    @my_order = []
    @total = 0
  end

  

  def order

  end



end
