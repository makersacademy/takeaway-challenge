class Menu

  attr_accessor :list, :menu, :basket

  def initialize
    @list = Hash[:sloppy_sandwich, 2.00, :slimy_salami, 5.00]
    @basket = {}
  end

  def add_item(dish, price)
    @list[dish] = price
  end

  def show_menu
    @list.each {|item, price| puts "#{item}:     #{price}"}
  end

  def receive_order(dish)
    @basket[dish] = @list[dish] 
  end

  def show_basket
    @basket.each {|item, price| puts "#{item}:     #{price}"}
  end
end