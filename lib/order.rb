require_relative 'takeaway'
class MyOrder

  attr_accessor :basket

  def initialize (takeaway = Takeaway.new)
    @basket = []
    @takeaway = takeaway
  end

  def order(item)
    raise "Item is not on the menu" unless @takeaway.menu.key?(item)
    @basket << { item => @takeaway.menu[item] }
  end

  def total 
    sum = 0
    @basket.each do |menu_item|
      menu_item.each do |item, price|
        sum += price
      end
    end
    sum
  end

end