require './lib/menu.rb'
class TakeAway
  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
    @total = 0
  end

  def read_menu
    @menu.read_menu
  end

  def add_to_basket(dessert)
  raise 'Unknown item' if @menu.dishes.select{|dish| dish.include?(dessert)}.empty?
  @basket << @menu.dishes.select{|dish| dish.include?(dessert)}.pop
  end

  def see_basket
    @basket.each{|item| item.each{|name, price|
      @total += price
      puts name}}
      puts "total: £#{@total}"
      return "total: £#{@total}"
  end
end
