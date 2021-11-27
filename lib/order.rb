require_relative 'takeaway'
class MyOrder

  attr_accessor :basket

  def initialize(takeaway = Takeaway.new)
    @basket = []
    @takeaway = takeaway
  end

  def order(item)
    raise "Item is not on the menu" unless on_menu?(item)
    @basket << { item => @takeaway.menu[item] }
  end

  def total 
    sum = 0
    @basket.each do |menu_item|
      menu_item.each do |_item, price|
        sum += price
      end
    end
    sum
  end

  def confirm_order
    raise 'Basket is empty, cannot confirm order' if basket_empty?
  end

  private

  def on_menu?(item)
    @takeaway.menu.key?(item)
  end

  def basket_empty?
    @basket.empty?
  end
end
