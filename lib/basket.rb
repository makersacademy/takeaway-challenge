require_relative 'menu'

class Basket
  attr_reader :menu_class, :total, :items
  
  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @total = 0
    @items = []
  end

  def add(item, quantity=1)
      quantity.times {@items << item}
  end

  def calc_total
    @total += @items.map { |item| @menu_class.new.item_price(item) }.sum 
  end

  def show_total
    calc_total
    total
  end

end