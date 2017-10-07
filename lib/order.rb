require 'menu'
class Order

  attr_reader :items, :total

  def initialize
    @items = []
    @total = 0
  end

  def input_items(order)
    @items = Menu.new.select(order)
  end

  def verify_total
    @items.each { |item| @total += item[:price] }
    @total
  end

end
