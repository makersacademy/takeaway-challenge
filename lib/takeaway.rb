require './lib/menu.rb'
class TakeAway
  attr_reader :basket, :menu, :total

  def initialize
    @basket = []
    @menu = Menu.new
    @total = 0
  end

  def read_menu
    @menu.read_menu
  end

  def add_to_basket(dessert)
    raise 'Unknown item' unless in_menu?(dessert)
    item = @menu.dishes.select { |dish| dish.include?(dessert) }.pop
    @basket << item
    item.select{|x,y| @total += y}
  end

  def remove_from_basket(dessert)
    @basket.select { |item| item.each { |name, _| @basket.delete item if name == dessert } }
  end

  def empty_basket
    @basket = []
  end

  def see_basket
    @basket.each { |item| item.each { |name, price|
      puts name
    } }
    puts "total: £#{@total}"
    return "total: £#{@total}"
  end

  private
  def in_menu?(dessert)
    !@menu.dishes.select { |dish| dish.include?(dessert) }.empty?
  end
end
